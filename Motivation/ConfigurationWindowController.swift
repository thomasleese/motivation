//
//  ConfigurationWindow.swift
//  Motivation
//
//  Created by Thomas Leese on 29/09/2017.
//  Copyright © 2017 Thomas Leese. All rights reserved.
//

import Cocoa

class ConfigurationWindowController: NSWindowController {

    @IBAction func close(sender: AnyObject?) {
        if let window = window {
            window.sheetParent?.endSheet(window)
        }
    }
    
}
