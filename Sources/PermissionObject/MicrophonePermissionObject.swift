//
//  MicrophonePermissionObject.swift
//  PermissionApp
//
//  Created by sun on 07/10/2022.
//

import Foundation
import AVFAudio

final class MicrophonePermissionObject: PermissionType {
    
    var permissionHandler: PermissionHandler?
    var name: String = "Microphone"
    var summany: String = "Let hear your voice"
    var emptyImage: String = "microphone_empty"
    var fullImage: String = "microphone_full"
    let audioSession = AVAudioSession.sharedInstance()
    
    func requestPermission() {
        audioSession.requestRecordPermission { [unowned self] granted in
            DispatchQueue.main.async {
                if granted {
                    self.permissionHandler?(.allowed)
                } else {
                    self.permissionHandler?(.notAllow)
                }
            }
        }
    }
    
    func checkStatus(handler: @escaping (PermissionStatus) -> Void) {
        if audioSession.recordPermission == .granted {
            handler(.allowed)
        } else {
            handler(.notAllow)
        }
    }
}
