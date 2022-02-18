//
//  UserDefaults+Extension.swift
//  FoodApp
//
//  Created by Admin on 2022-02-18.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys : String {
        case hasOnboarded
    }
    
    var hasOnboarded : Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
            
        }set{
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
    }
}
