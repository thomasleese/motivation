//
//  Preferences.swift
//  Motivation
//
//  Created by Thomas Leese on 14/11/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import ScreenSaver

class Preferences: NSObject {

    static let birthDateDidChangeNotificationName = NSNotification.Name(rawValue: "Preferences.birthDateDidChangeNotification")

    private static let birthDateKey = "Birth Date"

    var birthDate: Date? {
        get {
            let timestamp = defaults?.object(forKey: type(of: self).birthDateKey) as? TimeInterval
            return timestamp.map { Date(timeIntervalSince1970: $0) }
        }

        set {
            if let date = newValue {
                defaults?.set(date.timeIntervalSince1970, forKey: type(of: self).birthDateKey)
            } else {
                defaults?.removeObject(forKey: type(of: self).birthDateKey)
            }
            defaults?.synchronize()

            NotificationCenter.default.post(name: type(of: self).birthDateDidChangeNotificationName, object: newValue)
        }
    }

    private let defaults: ScreenSaverDefaults? = {
        let bundleIdentifier = Bundle(for: Preferences.self).bundleIdentifier
        return bundleIdentifier.flatMap { ScreenSaverDefaults(forModuleWithName: $0) }
    }()

}
