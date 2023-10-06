//
//  UserDefaultsManager.swift
//  Handymanclasses
//
//  Created by Nurillo Domlajonov on 06/10/23.
//

import Foundation


class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    let defaults = UserDefaults()
    
    func saveNickName(nickName: String){
        defaults.setValue(nickName, forKey: "nickName")
    }
    
    func getNickName()->String {
        return defaults.object(forKey: "nickName") as? String ?? "unknown"
    }
    
    func setStatus(status: Bool){
        defaults.setValue(status, forKey: "status")
    }
    
    func getSoundStatus()->Bool {
        return defaults.objectIsForced(forKey: "status")
    }
    
}
