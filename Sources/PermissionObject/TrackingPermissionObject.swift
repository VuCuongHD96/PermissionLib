//
//  TrackingPermissionObject.swift
//  PermissionApp
//
//  Created by sun on 02/10/2022.
//

import Foundation
import AppTrackingTransparency

class TrackingPermissionObject: PermissionType {
    
    var permissionHandler: PermissionHandler?
    var name: String = "Tracking"
    var summany: String = "Tracking your action"
    var emptyImage: String = "tracking_empty"
    var fullImage: String = "tracking_full"
    
    func requestPermission() {
        ATTrackingManager.requestTrackingAuthorization { [weak self] status in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if status == .authorized {
                    self.permissionHandler?(.allowed)
                } else {
                    self.permissionHandler?(.notAllow)
                }
            }
        }
    }
    
    func checkStatus(handler: @escaping (PermissionStatus) -> Void) {
        if ATTrackingManager.trackingAuthorizationStatus == .authorized {
            handler(.allowed)
        } else {
            handler(.notAllow)
        }
    }
}
