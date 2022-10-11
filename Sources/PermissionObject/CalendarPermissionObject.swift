//
//  CalendarPermissionObject.swift
//  PermissionApp
//
//  Created by sun on 08/10/2022.
//

import Foundation
import EventKit

final class CalendarPermissionObject: PermissionType {
    
    var permissionHandler: PermissionHandler?
    var name: String = "Calendar"
    var summany: String = "Access to your future"
    var emptyImage: String = "calendar_empty"
    var fullImage: String = "calendar_full"
    let eventStore = EKEventStore()
    
    func requestPermission() {
        eventStore.requestAccess(to: EKEntityType.event) { [unowned self] (granted: Bool, error: Error?) in
            DispatchQueue.main.async {
                if granted {
                    self.permissionHandler?(.allowed)
                } else {
                    self.permissionHandler?(.notAllow)
                }
            }
        }
    }
    
    func checkStatus(handler: @escaping (PermissionStatus) -> Void) {
        let status = EKEventStore.authorizationStatus(for: .event)
        if status == .authorized {
            handler(.allowed)
        } else {
            handler(.notAllow)
        }
    }
}
