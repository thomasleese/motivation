//
//  MotivationView.swift
//  Motivation
//
//  Created by Thomas Leese on 29/09/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import ScreenSaver

class MotivationView: ScreenSaverView {
    
    private lazy var configurationWindowController: NSWindowController = {
        return ConfigurationWindowController()
    }()

    let lifeExpectancy = LifeExpectancy(dateOfBirth: Date(timeIntervalSince1970: 785844000))

    var lifeExpectancyLayout: LifeExpectancyLayout {
        return LifeExpectancyLayout(bounds: bounds, lifeExpectancy: lifeExpectancy)
    }

    var lifeExpectancyDrawer: LifeExpectancyDrawer {
        return LifeExpectancyDrawer(lifeExpectancy: lifeExpectancy, layout: lifeExpectancyLayout)
    }

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)

        animationTimeInterval = 60
    }
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)

        animationTimeInterval = 60
    }

    override func viewDidMoveToSuperview() {
        super.viewDidMoveToSuperview()
    }

    override func draw(_ rect: NSRect) {
        lifeExpectancyDrawer.draw()
    }

    override func hasConfigureSheet() -> Bool {
        return true
    }
    
    override func configureSheet() -> NSWindow? {
        return configurationWindowController.window
    }
    
}
