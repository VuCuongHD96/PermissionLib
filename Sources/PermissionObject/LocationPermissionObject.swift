//
//  LocationPermissionObject.swift
//  PermissionApp
//
//  Created by Sun on 08/09/2022.
//

import MapKit

class LocationPermissionObject: NSObject, PermissionType {
    
    var permissionHandler: PermissionHandler?
    var name: String = "Location"
    var summany: String = "Allow to acces your location"
    var emptyImage: String = "location_empty"
    var fullImage: String = "location_full"
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func checkStatus(handler: @escaping (PermissionStatus) -> Void) {
        let status = locationManager.authorizationStatus
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            handler(.allowed)
        } else {
            handler(.notAllow)
        }
    }
    
    func requestPermission() {
        let status = locationManager.authorizationStatus
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            print("Location author")
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension LocationPermissionObject: CLLocationManagerDelegate {
    
    func locationManager (_ manager: CLLocationManager,
                          didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied {
            permissionHandler?(.notAllow)
        } else {
            permissionHandler?(.allowed)
        }
    }
}
