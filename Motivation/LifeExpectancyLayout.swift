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

    var availableDots: Int {
        return Int(bounds.width * bounds.height)
    }

    var dotSize: Double {
        return (Double(availableDots) / Double(lifeExpectancy.totalDays)).squareRoot().rounded()
    }

    var xDots: Int {
        return Int((bounds.width / CGFloat(dotSize)).rounded())
    }

    var yDots: Int {
        return Int((bounds.height / CGFloat(dotSize)).rounded())
    }

    var xMargin: Double {
        return (Double(xDots) * dotSize - Double(bounds.width)) / 2.0
    }

    var yMargin: Double {
        return (Double(yDots) * dotSize - Double(bounds.height)) / 2.0
    }

}
