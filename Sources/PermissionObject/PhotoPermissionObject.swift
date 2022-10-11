//
//  PhotoPermissionObject.swift
//  PermissionApp
//
//  Created by sun on 07/10/2022.
//

import Foundation
import PhotosUI

class PhotoPermissionObject: PermissionType {
    
    var permissionHandler: PermissionHandler?
    var name: String = "Photo Library"
    var summany: String = "Access your photo library"
    var emptyImage: String = "photo_empty"
    var fullImage: String = "photo_full"
    
    func requestPermission() {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { [unowned self] (status) in
            DispatchQueue.main.async { [unowned self] in
                if status == .authorized {
                    permissionHandler?(.allowed)
                } else {
                    permissionHandler?(.notAllow)
                }
            }
        }
    }
    
    func checkStatus(handler: @escaping (PermissionStatus) -> Void) {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        if status == .authorized {
            handler(.allowed)
        } else {
            handler(.notAllow)
        }
    }
}
