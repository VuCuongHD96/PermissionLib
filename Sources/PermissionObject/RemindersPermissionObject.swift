//
//  RemindersPermissionObject.swift
//  PermissionApp
//
//  Created by sun on 06/10/2022.
//

import Foundation
import EventKit

class RemindersPermissionObject: PermissionType {
    
    var permissionHandler: PermissionHandler?
    var name: String = "Reminders"
    var summany: String = "Let remind some thing"
    var emptyImage: String = "reminders_empty"
    var fullImage: String = "reminders_full"
    let eventStore = EKEventStore()
    
    func requestPermission() {
        eventStore.requestAccess(to: .reminder) { [weak self] permission, error in
            guard let self = self else { return }
            DispatchQueue.main.async {            
                if permission {
                    self.permissionHandler?(.allowed)
                } else {
                    self.permissionHandler?(.notAllow)
                }
            }
        }
    }
    
    func checkStatus(handler: @escaping (PermissionStatus) -> Void) {
        let status = EKEventStore.authorizationStatus(for: .reminder)
        if status == .authorized {
            handler(.allowed)
        } else {
            handler(.notAllow)
        }
    }
}
