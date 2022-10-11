//
//  SiriPermissionObject.swift
//  PermissionApp
//
//  Created by sun on 01/10/2022.
//

import Foundation
import Intents

class SiriPermissionObject: PermissionType {
    
    var permissionHandler: PermissionHandler?
    
    var name: String = "Siri"
    var summany: String = "Let Siri find what you want"
    var emptyImage: String = "siri_empty"
    var fullImage: String = "siri_full"
    
    func requestPermission() {
        INPreferences.requestSiriAuthorization { [weak self] status in
            guard let self = self else { return }
            if status == .authorized {
                self.permissionHandler?(.allowed)
            } else {
                self.permissionHandler?(.notAllow)
            }
        }
    }
    
    func checkStatus(handler: @escaping (PermissionStatus) -> Void) {
        let status = INPreferences.siriAuthorizationStatus()
        if status == .authorized {
            handler(.allowed)
        } else {
            handler(.notAllow)
        }
    }
}
