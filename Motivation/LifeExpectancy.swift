//
//  LifeExpectancy.swift
//  Motivation
//
//  Created by Thomas Leese on 14/11/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import Foundation

class LifeExpectancy {

    let averageAgeAtDeath = 81.60
    let daysInYear = 365.25

    let dateOfBirth: Date

    init(dateOfBirth: Date) {
        self.dateOfBirth = dateOfBirth
    }

    var totalDays: Double {
        return (averageAgeAtDeath * daysInYear).rounded()
    }

    var daysSpent: Double {
        let today = Date()
        return secondsToDays(seconds: Calendar.current.dateComponents([.second], from: self.dateOfBirth, to: today).second!)
    }

    var daysLeft: Double {
        return totalDays - daysSpent
    }

    private func secondsToDays(seconds: Int) -> Double {
        return Double(seconds) / 60.0 / 60.0 / 24.0
    }

}
