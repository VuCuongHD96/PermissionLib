//
//  PermissionManager.swift
//  PermissionApp
//
//  Created by Sun on 09/09/2022.
//

import UIKit

public struct PermissionManager {
    
    // MARK: - Property
    let permissionViewController = PermissionViewController()
    
    public init() { }
    
    // MARK: - Data
    public func showListPermission() {
        guard let permissionObjectArray = readPermissionKey() else {
            return
        }
        permissionViewController.permissionObjectArray = permissionObjectArray
        let navController = UINavigationController(rootViewController: permissionViewController)
        navController.navigationBar.prefersLargeTitles = true
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) ?? UIApplication.shared.windows.first
        let topController = keyWindow?.rootViewController
        topController?.present(navController, animated: true, completion: nil)
    }
    
    func reload() {
        permissionViewController.reload()
    }
    
    func readPermissionKey() -> [PermissionType]? {
        let keys = Bundle.main.infoDictionary?.keys
        let permissionObjectArray = keys?.compactMap { key in
            return PermissionKey(rawValue: key)?.permissionObject
        }
        return permissionObjectArray
    }
}
