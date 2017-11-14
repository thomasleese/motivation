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

    var totalDays: Int {
        return Int((averageAgeAtDeath * daysInYear).rounded())
    }

    var daysSpent: Int {
        let today = Date()
        return Calendar.current.dateComponents([.day], from: self.dateOfBirth, to: today).day!
    }

    var daysLeft: Int {
        return totalDays - daysSpent
    }

}
