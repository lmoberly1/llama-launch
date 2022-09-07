//
//  CustomizeUnlock.swift
//  Llama
//
//  Created by Luke Moberly on 5/26/20.
//  Copyright © 2020 Luke Moberly. All rights reserved.
//

import Foundation
import UIKit


class CustomizeUnlock {
    
    static let shared = CustomizeUnlock() // instance of CustomizeUnlock class (object)
    
    let defaults = UserDefaults.standard
    
    func llamaColorDefaults() {
        defaults.register(defaults: ["redColorLocked" : true])
        defaults.register(defaults: ["yellowColorLocked" : true])
        defaults.register(defaults: ["greenColorLocked" : true])
        defaults.register(defaults: ["purpleColorLocked" : true])
        defaults.register(defaults: ["grayColorLocked" : true])
    }
    
    func hatDefaults() {
        defaults.register(defaults: ["redHatLocked" : true])
        defaults.register(defaults: ["whiteHatLocked" : true])
        defaults.register(defaults: ["goldHatLocked" : true])
        defaults.register(defaults: ["blackHatLocked" : true])
        defaults.register(defaults: ["greenHatLocked" : true])
        defaults.register(defaults: ["turqHatLocked" : true])
        defaults.register(defaults: ["pinkHatLocked" : true])
        defaults.register(defaults: ["grayHatLocked" : true])
        defaults.register(defaults: ["purpleHatLocked" : true])
        defaults.register(defaults: ["blueHatLocked" : true])
    }
    
    func sweaterDefaults() {
        defaults.register(defaults: ["blackSweaterLocked" : true])
        defaults.register(defaults: ["whiteSweaterLocked" : true])
        defaults.register(defaults: ["navySweaterLocked" : true])
        defaults.register(defaults: ["redSweaterLocked" : true])
        defaults.register(defaults: ["graySweaterLocked" : true])
        defaults.register(defaults: ["purpleSweaterLocked" : true])
        defaults.register(defaults: ["goldSweaterLocked" : true])
        defaults.register(defaults: ["blueSweaterLocked" : true])
        defaults.register(defaults: ["heartSweaterLocked" : true])
        defaults.register(defaults: ["treeSweaterLocked" : true])
    }
    
    func scarfDefaults() {
        defaults.register(defaults: ["blackScarfLocked" : true])
        defaults.register(defaults: ["whiteScarfLocked" : true])
        defaults.register(defaults: ["navyScarfLocked" : true])
        defaults.register(defaults: ["redScarfLocked" : true])
        defaults.register(defaults: ["grayScarfLocked" : true])
        defaults.register(defaults: ["purpleScarfLocked" : true])
        defaults.register(defaults: ["goldScarfLocked" : true])
        defaults.register(defaults: ["blueScarfLocked" : true])
        defaults.register(defaults: ["pinkScarfLocked" : true])
        defaults.register(defaults: ["greenScarfLocked" : true])
    }
    
    
}
