//
//  Customize.swift
//  Llama
//
//  Created by Luke Moberly on 5/15/20.
//  Copyright © 2020 Luke Moberly. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class CustomizeScene: SKScene {
    
    let defaults = UserDefaults.standard
    
    // BUTTONS
    let mainMenuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 50))
    let colorButton = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 75))
    let hatButton = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 75))
    let sweaterButton = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 75))
    let scarfButton = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 75))
    let coinLabel = UIImageView(frame: CGRect(x: 0, y: 0, width: 43, height: 45))
    let coinText = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 40))

    // TEXTURES
    let backgroundTexture = SKTexture(imageNamed: "background")
    
    
    // SCENE LOAD
    override func sceneDidLoad() {
        
//        let widthMultiplier = self.frame.size.width/375
//        let heightMultiplier = self.frame.size.height/667
//
//        for label in [mainMenuButton, colorButton, hatButton, sweaterButton, scarfButton] {
//            label.frame.size.width = label.frame.width * widthMultiplier
//            label.frame.size.height = label.frame.height * heightMultiplier
//        }
        
        // MAIN MENU BUTTON
        mainMenuButton.center = CGPoint(x: frame.size.width/2, y: 0.90 * frame.size.height)
        mainMenuButton.backgroundColor = .clear
        mainMenuButton.setTitle("BACK", for: .normal)
        mainMenuButton.setTitleColor(.black, for: .normal)
        mainMenuButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 45)
        mainMenuButton.titleLabel?.textAlignment = .center
        mainMenuButton.tag = 1
        mainMenuButton.addTarget(self, action: #selector(Menu), for: .touchUpInside)
        
        // LLAMA COLOR
        colorButton.center = CGPoint(x: frame.size.width/2, y: 0.20 * frame.size.height)
        colorButton.backgroundColor = .white
        colorButton.setTitle("LLAMA COLOR", for: .normal)
        colorButton.setTitleColor(.black, for: .normal)
        colorButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 40)
        colorButton.titleLabel?.textAlignment = .center
        colorButton.tag = 2
        colorButton.addTarget(self, action: #selector(Menu), for: .touchUpInside)
        
        // HATS
        hatButton.center = CGPoint(x: frame.size.width/2, y: 0.35 * frame.size.height)
        hatButton.backgroundColor = .white
        hatButton.setTitle("HATS", for: .normal)
        hatButton.setTitleColor(.black, for: .normal)
        hatButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 40)
        hatButton.titleLabel?.textAlignment = .center
        hatButton.tag = 3
        hatButton.addTarget(self, action: #selector(Menu), for: .touchUpInside)
        
        // SWEATER
        sweaterButton.center = CGPoint(x: frame.size.width/2, y: 0.65 * frame.size.height)
        sweaterButton.backgroundColor = .white
        sweaterButton.setTitle("SWEATERS", for: .normal)
        sweaterButton.setTitleColor(.black, for: .normal)
        sweaterButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 40)
        sweaterButton.titleLabel?.textAlignment = .center
        sweaterButton.tag = 4
        sweaterButton.addTarget(self, action: #selector(Menu), for: .touchUpInside)
        
        // SCARF
        scarfButton.center = CGPoint(x: frame.size.width/2, y: 0.50 * frame.size.height)
        scarfButton.backgroundColor = .white
        scarfButton.setTitle("SCARVES", for: .normal)
        scarfButton.setTitleColor(.black, for: .normal)
        scarfButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 40)
        scarfButton.titleLabel?.textAlignment = .center
        scarfButton.tag = 5
        scarfButton.addTarget(self, action: #selector(Menu), for: .touchUpInside)
        
        // COINS
        coinLabel.center = CGPoint(x: 30, y: frame.size.height - 30)
        coinLabel.image = UIImage(named: "llamaCoin")
        coinText.text = "\(defaults.integer(forKey: "coins"))"
        coinText.textAlignment = .left
        coinText.font = UIFont(name: "SuperMarioGalaxy", size: 30)
        coinText.center = CGPoint(x: coinLabel.center.x + 155, y: frame.size.height - 28)
        
        if defaults.bool(forKey: "music") == true {
            MusicManager.shared.play()
        } else {
            MusicManager.shared.stop()
        }
    }

    
    override func didMove(to view: SKView) {
        createBackground()
        self.view?.addSubview(mainMenuButton)
        self.view?.addSubview(colorButton)
        self.view?.addSubview(hatButton)
        self.view?.addSubview(sweaterButton)
        self.view?.addSubview(scarfButton)
        self.view?.addSubview(coinLabel)
        self.view?.addSubview(coinText)

    }
    
    // LOAD BACKGROUND
    func createBackground() {
        let backgroundTexture = SKTexture(imageNamed: "background")
        for i in 0 ... 2 {
            // SPAWN BACKGROUND
            let background = SKSpriteNode(texture: backgroundTexture)
            background.zPosition = -30
            background.anchorPoint = CGPoint.zero
            background.position = CGPoint(x: (backgroundTexture.size().width * CGFloat(i) - CGFloat(1 * i)), y: 0)
            background.size.height = frame.size.height
            addChild(background)
        }
    }
    
    // RETURN TO MAIN MENU
    @objc func Menu(sender: UIButton!) {
        // HIDE EXISTING LABELS
        for label in [mainMenuButton, colorButton, hatButton, sweaterButton, scarfButton, coinLabel, coinText] {
            label.isHidden = !label.isHidden
        }
        // TRANSITION TO MAIN MENU
        if sender.tag == 1 {
            view!.presentScene(StartScene(size: self.size))
        } else if sender.tag == 2 {
            view!.presentScene(ColorScene(size: self.size))
        } else if sender.tag == 3 {
            view!.presentScene(HatScene(size: self.size))
        } else if sender.tag == 4 {
            view!.presentScene(SweaterScene(size: self.size))
        } else if sender.tag == 5 {
            view!.presentScene(ScarfScene(size: self.size))
        }
    }
    

    
}


