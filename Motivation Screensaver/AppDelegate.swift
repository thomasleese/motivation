//
//  AppDelegate.swift
//  Motivation Screensaver
//
//  Created by Thomas Leese on 14/11/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    lazy var screenSaverView = MotivationView(frame: NSZeroRect, isPreview: false)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let screenSaverView = screenSaverView {
            if let contentView = window.contentView {
                window.setFrame(NSRect(x: 10, y: 10, width: 997, height: 785), display: true)
                screenSaverView.frame = contentView.bounds
                contentView.addSubview(screenSaverView)
            }
        }
    }

}
