//
//  PermissionType.swift
//  PermissionApp
//
//  Created by Sun on 07/09/2022.
//

import UIKit

protocol PermissionType {
    
    // MARK: - Define
    typealias PermissionHandler = (PermissionStatus) -> Void
    
    // MARK: - Property
    var permissionHandler: PermissionHandler? { get set }
    var name: String { get set }
    var summany: String { get set }
    var emptyImage: String { get set }
    var fullImage: String { get set }
    
    // MARK: - func
    func requestPermission()
    func checkStatus(handler: @escaping (PermissionStatus) -> Void)
}

extension PermissionType {
    
    func suggetOpenSetting() {
        if let appSettings = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(appSettings) {
            UIApplication.shared.open(appSettings)
        }
    }
}
