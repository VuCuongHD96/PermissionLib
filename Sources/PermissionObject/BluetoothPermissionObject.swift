//
//  BluetoothPermissionObject.swift
//  PermissionApp
//
//  Created by Sun on 13/09/2022.
//

import CoreBluetooth

protocol BluetoothManagerDelegate: AnyObject {
    func sendBluetoothStatus(_ status: Bool)
}

class BluetoothPermissionObject: NSObject {
    
    var manager = CBCentralManager()
    weak var bluetoothManagerDelegate: BluetoothManagerDelegate?
    
    override init() {
        super.init()
        manager.delegate = self
    }
}

extension BluetoothPermissionObject: CBCentralManagerDelegate {
    
    @objc func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        switch central.state {
        case .unknown:
            print("------ debug ------- unknown")
        case .resetting:
            print("------ debug ------- resetting")
        case .unsupported:
            print("------ debug ------- unsupported")
        case .unauthorized:
            print("------ debug ------- unauthorized")
        case .poweredOff:
            print("------ debug ------- poweredOff")
        case .poweredOn:
            print("------ debug ------- poweredOn")
        @unknown default:
            print("------ debug ------- default")
        }
        
        if central.state == .poweredOn {
            bluetoothManagerDelegate?.sendBluetoothStatus(true)
        } else {
            bluetoothManagerDelegate?.sendBluetoothStatus(false)
        }
    }
}
