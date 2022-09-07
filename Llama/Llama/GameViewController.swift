//
//  GameViewController.swift
//  Llama
//
//  Created by Luke Moberly on 5/12/20.
//  Copyright © 2020 Luke Moberly. All rights reserved.
//

import UIKit
import GoogleMobileAds
import SpriteKit
import GameplayKit
import AVFoundation

let BannerAd = GADBannerView(adSize: kGADAdSizeBanner)

class GameViewController: UIViewController, GADBannerViewDelegate {
    
    let defaults = UserDefaults.standard
    let ignoresSiblingOrder = true

    // VIEW LOADER
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // LOAD SCENE
        let scene = StartScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        MusicManager.shared.setup()
        
        // LOAD MUISC
        defaults.register(defaults: ["music" : true])
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
        
        
        // HIGH SCORE DEFAULT
        let highScore = defaults.integer(forKey: "highScore")
        defaults.set(highScore, forKey: "highScore")
        
        // DEFAULTS
        defaults.register(defaults: ["llamaLeapingColor" : "BlueLeaping"])
        defaults.register(defaults: ["llamaStandingColor" : "BlueStanding"])
        defaults.register(defaults: ["hatColor" : "NoHat"])
        defaults.register(defaults: ["sweaterColor" : "NoSweater"])
        defaults.register(defaults: ["scarfColor" : "NoScarf"])
        defaults.register(defaults: ["medalCeremony" : "None"])
        defaults.register(defaults: ["coins": 250])
        defaults.register(defaults: ["canDailyReward" : false])
        defaults.register(defaults: ["achievedHighScore5": false])
        defaults.register(defaults: ["achievedHighScore25": false])
        
        CustomizeUnlock.shared.llamaColorDefaults()
        CustomizeUnlock.shared.hatDefaults()
        CustomizeUnlock.shared.sweaterDefaults()
        CustomizeUnlock.shared.scarfDefaults()

        // ADS
        BannerAd.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        BannerAd.delegate = self
        BannerAd.adUnitID = "ca-app-pub-5963270667921614/6698036727" // REAL ADS
//        BannerAd.adUnitID = "ca-app-pub-3940256099942544/6300978111" // TEST ADS
        BannerAd.rootViewController = self
        BannerAd.load(GADRequest())
        view.addSubview(BannerAd)
        
        // PRESENT SCENE
        skView.presentScene(scene)

    }

    // STATUS BAR
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
