//
//  ViewController.swift
//  Example
//
//  Created by sun on 11/10/2022.
//

import UIKit
import PermissionLib

class ViewController: UIViewController {

    let permissionManager = PermissionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        permissionManager.showListPermission()
    }
}

