//
//  LifeExpectancyLayout.swift
//  Motivation
//
//  Created by Thomas Leese on 14/11/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import Foundation

class LifeExpectancyLayout {

    let bounds: NSRect
    let lifeExpectancy: LifeExpectancy

    init(bounds: NSRect, lifeExpectancy: LifeExpectancy) {
        self.bounds = bounds
        self.lifeExpectancy = lifeExpectancy
    }

    var availableWidth: Double {
        return Double(bounds.width)
    }

    var availableHeight: Double {
        return Double(bounds.height)
    }

    var availableDots: Int {
        return Int(availableWidth * availableHeight)
    }

    var dotSize: Double {
        return floor((Double(availableDots) / Double(lifeExpectancy.totalDays)).squareRoot())
    }

    var xDots: Int {
        return Int(floor(availableWidth / dotSize))
    }

    var yDots: Int {
        return Int(ceil(Double(lifeExpectancy.totalDays) / Double(xDots)))
    }

    var xMargin: Double {
        return (availableWidth - Double(xDots) * dotSize) / 2.0
    }

    var yMargin: Double {
        return (availableHeight - Double(yDots) * dotSize) / 2.0
    }

}
