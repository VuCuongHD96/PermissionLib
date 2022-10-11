//
//  PermissionKey.swift
//  PermissionApp
//
//  Created by Sun on 10/09/2022.
//

import Foundation

enum PermissionKey: String {
    
    case blutooth = "NSBluetoothAlwaysUsageDescription"
    case calendar = "NSCalendarsUsageDescription"
    case camera = "NSCameraUsageDescription"
    case contacts = "NSContactsUsageDescription"
    case faceID = "NSFaceIDUsageDescription"
    case health = "NSHealthUpdateUsageDescription"
    case location = "NSLocationAlwaysAndWhenInUseUsageDescription"
    case siri = "NSSiriUsageDescription"
    case tracking = "NSUserTrackingUsageDescription"
    case reminder = "NSRemindersUsageDescription"
    case photo = "NSPhotoLibraryUsageDescription"
    case microphone = "NSMicrophoneUsageDescription"
    
    var permissionObject: PermissionType? {
        switch self {
        case .blutooth:
            return nil
        case .calendar:
            return CalendarPermissionObject()
        case .camera:
            return nil
        case .contacts:
            return ContactPermissionObject()
        case .faceID:
            return nil
        case .health:
            return nil
        case .location:
            return LocationPermissionObject()
        case .siri:
            return SiriPermissionObject()
        case .tracking:
            return TrackingPermissionObject()
        case .reminder:
            return RemindersPermissionObject()
        case .photo:
            return PhotoPermissionObject()
        case .microphone:
            return MicrophonePermissionObject()
        }
    }
}
