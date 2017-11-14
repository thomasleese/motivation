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

    override func startAnimation() {
        super.startAnimation()
    }
    
    override func stopAnimation() {
        super.stopAnimation()
    }
    
    override func draw(_ rect: NSRect) {
        NSColor.red.setFill()
        NSRectFill(self.bounds)
        NSColor.black.set()
        
        let hello:NSString = "hello SWIFT screen saver plugin"
        hello.draw(at: NSPoint(x: 100.0, y: 200.0), withAttributes:nil)
    }
    
    override func animateOneFrame() {
        super.animateOneFrame()
    }
    
    override func hasConfigureSheet() -> Bool {
        return true
    }
    
    override func configureSheet() -> NSWindow? {
        return configurationWindowController.window
    }
    
}
