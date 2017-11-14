//
//  LifeExpectancyDrawer.swift
//  Motivation
//
//  Created by Thomas Leese on 14/11/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import AppKit

class LifeExpectancyDrawer {

    let daysSpentColour = NSColor(red: 0.173, green: 0.243, blue: 0.314, alpha: 1.0)
    let daysLeftColour = NSColor(red: 0.161, green: 0.502, blue: 0.725, alpha: 1.0)

    let labelColour = NSColor.white

    let lifeExpectancy: LifeExpectancy
    let layout: LifeExpectancyLayout

    init(lifeExpectancy: LifeExpectancy, layout: LifeExpectancyLayout) {
        self.lifeExpectancy = lifeExpectancy
        self.layout = layout
    }

    private func clearBackground() {
        daysLeftColour.setFill()
        NSRectFill(layout.bounds)
    }

    private func drawDots() {
        daysSpentColour.setFill()

        var currentDay = 0

        for yDot in 0...layout.yDots {
            for xDot in 0...layout.xDots {
                let x = layout.xMargin + Double(xDot) * layout.dotSize
                let y = Double(layout.bounds.height) - (layout.yMargin + Double(yDot) * layout.dotSize)
                let width = layout.dotSize
                let height = layout.dotSize

                NSRectFill(NSRect(x: x, y: y, width: width, height: height))

                if currentDay > lifeExpectancy.daysSpent {
                    return
                }
                currentDay += 1
            }
        }
    }

    var daysSpentString: NSString {
        return String(format: "%d days spent", lifeExpectancy.daysSpent) as NSString
    }

    var daysLeftString: NSString {
        return String(format: "%d days left", lifeExpectancy.daysLeft) as NSString
    }

    private func drawLabels() {
        labelColour.setStroke()

        let font = NSFont(name: "Futura", size: 26)

        let paragraphStyle = NSParagraphStyle.default().mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.alignment = .center

        let attributes = [
            NSForegroundColorAttributeName: labelColour,
            NSFontAttributeName: font,
            NSParagraphStyleAttributeName: paragraphStyle,
        ]

        daysSpentString.draw(in: NSRect(x: 0, y: layout.bounds.height - 60, width: 260, height: 50), withAttributes: attributes)

        daysLeftString.draw(in: NSRect(x: layout.bounds.width - 260, y: 0, width: 260, height: 50), withAttributes: attributes)
    }

    func draw() {
        clearBackground()
        drawDots()
        drawLabels()
    }

}
