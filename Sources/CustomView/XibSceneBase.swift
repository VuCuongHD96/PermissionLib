//
//  XibSceneBase.swift
//  PermissionApp
//
//  Created by Sun on 09/09/2022.
//

import UIKit

protocol XibSceneBase: UIView {
    static var nibName: String { get }
}

extension XibSceneBase {
    
    static var nibName: String {
        return String(describing: self)
    }
}
