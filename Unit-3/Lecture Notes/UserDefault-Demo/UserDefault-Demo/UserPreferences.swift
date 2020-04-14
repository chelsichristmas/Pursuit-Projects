//
//  UserPreferences.swift
//  UserDefault-Demo
//
//  Created by Chelsi Christmas on 1/13/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import Foundation

enum UnitMeasurement: String {
    case miles = "Miles"
    case kilometers = "Kilometers"
}


enum ActivityImage: String {
    case bike = "bike"
    case run = "run"
    
}
struct UserPreferenceKey {
    static let unitMeasurement = "Unit Measurement"
    static let activity = "Activity"
}


class UserPreference {
    
    // a Singleton's  intializer NEEDS to be private - this ensures that only one instance  of this class is used through out the application
    
    private init() {}
    
    
    
    static let shared = UserPreference()
            
    func updateUnitMeasurement(with unit: UnitMeasurement)  {
        // storing or persisting the unit measurement value to UserDefaults (device or simulator as permanent storage
        
        // UserDefaults.standard is a Singleton in iOS that gives us access to saving and retrieving data in the device or simulator
        
        // This is the one line needed to save data to a device
        UserDefaults.standard.set(unit.rawValue, forKey:
            UserPreferenceKey.unitMeasurement)
        
        // key is "Unit Measurement"
        // value is either "Miles" or "Kilometers"
        // UserDefaultas: ["Unit Measurement" : "Kilometers"]
    }
    
    // retrieve a user default value (object)
    func getUnitMeasuremnet() -> UnitMeasurement? {
        
        guard let unitMeasurement = UserDefaults.standard.object(forKey: UserPreferenceKey.unitMeasurement) as? String else {
            return nil
        }
        return UnitMeasurement(rawValue: unitMeasurement)
    }
    
    
    func updateImageView(with unit: ActivityImage) {
        
        UserDefaults.standard.set(unit.rawValue, forKey: UserPreferenceKey.activity)
        
    }
    
    func getImageView() -> ActivityImage? {
        
        
        guard let activityImage = UserDefaults.standard.object(forKey: UserPreferenceKey.activity) as? String else {
            return nil
        }
        return ActivityImage(rawValue: activityImage)
    }
}
