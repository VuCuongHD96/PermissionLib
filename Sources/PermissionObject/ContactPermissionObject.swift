//
//  ContactPermissionObject.swift
//  PermissionApp
//
//  Created by sun on 18/09/2022.
//

import ContactsUI
import UIKit

final class ContactPermissionObject: PermissionType {
    
    var permissionHandler: PermissionHandler?
    var name: String = "Contacts"
    var summany: String = "Allow to acces your contact"
    var emptyImage: String = "contact_empty"
    var fullImage: String = "contact_full"
    let contact = CNContactStore()
  
    func requestPermission() {
        contact.requestAccess(for: .contacts) { [weak self] result, _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if result {
                    self.permissionHandler?(.allowed)
                } else {
                    self.permissionHandler?(.notAllow)
                }
            }
        }
    }
    
    func checkStatus(handler: @escaping (PermissionStatus) -> Void) {
        if CNContactStore.authorizationStatus(for: .contacts) == .authorized {
            handler(.allowed)
        } else {
            handler(.notAllow)
        }
    }
}
