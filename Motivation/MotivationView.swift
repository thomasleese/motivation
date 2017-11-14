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

    var dateOfBirth: Date? = Date(timeIntervalSince1970: 785845920)

    var lifeExpectancy: LifeExpectancy {
        return LifeExpectancy(dateOfBirth: dateOfBirth!)
    }

    var lifeExpectancyLayout: LifeExpectancyLayout {
        return LifeExpectancyLayout(bounds: bounds, lifeExpectancy: lifeExpectancy)
    }

    var lifeExpectancyDrawer: LifeExpectancyDrawer {
        return LifeExpectancyDrawer(lifeExpectancy: lifeExpectancy, layout: lifeExpectancyLayout)
    }

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        initialise()
    }
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        initialise()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    private func initialise() {
        animationTimeInterval = 1

        if let date = Preferences().birthDate {
            dateOfBirth = date
        }

        NotificationCenter.default.addObserver(self, selector: #selector(birthDateDidChange), name: Preferences.birthDateDidChangeNotificationName, object: nil)
    }

    @objc private func birthDateDidChange(notification: NSNotification?) {
        dateOfBirth = Preferences().birthDate!
        animateOneFrame()
    }

    override func animateOneFrame() {
        needsDisplay = true
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
