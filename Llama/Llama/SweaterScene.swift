//
//  LlamaColor.swift
//  Llama
//
//  Created by Luke Moberly on 5/15/20.
//  Copyright © 2020 Luke Moberly. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class SweaterScene: SKScene {
    
    let defaults = UserDefaults.standard
    let price: Int = 200
    
    // BUTTONS
    let mainMenuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 50))
    let acceptButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 75))
    let denyButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 75))
    let confirmLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 75))
    let notEnoughCoins = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 150))
    
    let blueButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let blackButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let goldButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let grayButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let heartButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let navyButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let redButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let purpleButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let treeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let whiteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 80))

    
    // TEXTURES
    let backgroundTexture = SKTexture(imageNamed: "background")
    
    
    // SCENE LOAD
    override func sceneDidLoad() {
        // MAIN MENU BUTTON
        mainMenuButton.center = CGPoint(x: frame.size.width/2, y: 0.90 * frame.size.height)
        mainMenuButton.backgroundColor = .clear
        mainMenuButton.setTitle("BACK", for: .normal)
        mainMenuButton.setTitleColor(.black, for: .normal)
        mainMenuButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 45)
        mainMenuButton.titleLabel?.textAlignment = .center
        mainMenuButton.addTarget(self, action: #selector(backMenu), for: .touchUpInside)
        
        confirmLabel.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2 - 37.5)
        confirmLabel.textAlignment = .center
        confirmLabel.text = "Confirm purchase"
        confirmLabel.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        confirmLabel.backgroundColor = .white
        confirmLabel.textColor = .black
        confirmLabel.layer.borderWidth = 2
        
        acceptButton.center = CGPoint(x: frame.size.width/2 - 75, y: confirmLabel.center.y + 75)
        acceptButton.setTitle("  Buy", for: .normal)
        acceptButton.setTitleColor(.black, for: .normal)
        acceptButton.backgroundColor = .white
        acceptButton.titleLabel?.textAlignment = .center
        acceptButton.layer.borderWidth = 2
        acceptButton.setImage(UIImage(named: "llamaCoin"), for: .normal)
        acceptButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        acceptButton.addTarget(self, action: #selector(acceptPurchase), for: .touchUpInside)
        
        denyButton.center = CGPoint(x: frame.size.width/2 + 75, y: confirmLabel.center.y + 75)
        denyButton.setTitle("Cancel", for: .normal)
        denyButton.setTitleColor(.black, for: .normal)
        denyButton.backgroundColor = .white
        denyButton.titleLabel?.textAlignment = .center
        denyButton.layer.borderWidth = 2
        denyButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        denyButton.addTarget(self, action: #selector(denyPurchase), for: .touchUpInside)
        
        notEnoughCoins.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        notEnoughCoins.setTitle("Not enough coins\n\n\n\nOK", for: .normal)
        notEnoughCoins.titleEdgeInsets = UIEdgeInsets.init(top: -10.0, left: 0.0, bottom: 0.0, right: 0.0)
        notEnoughCoins.setTitleColor(.black, for: .normal)
        notEnoughCoins.backgroundColor = .white
        notEnoughCoins.titleLabel?.textAlignment = .center
        notEnoughCoins.titleLabel?.textAlignment = .center
        notEnoughCoins.titleLabel?.lineBreakMode = .byWordWrapping
        notEnoughCoins.titleLabel?.numberOfLines = 0
        notEnoughCoins.layer.borderWidth = 2
        notEnoughCoins.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        notEnoughCoins.addTarget(self, action: #selector(removeLabel), for: .touchUpInside)
        
        // BLUE BUTTON
        blueButton.center = CGPoint(x: 0.75 * frame.size.width, y: 0.60 * frame.size.height)
        blueButton.setImage(UIImage(named: "BlueSweaterImage"), for: .normal)
        blueButton.tag = 1
        if defaults.bool(forKey: "blueSweaterLocked") == true {
            blueButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            blueButton.backgroundColor = .gray
            blueButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            blueButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 60.0)
            blueButton.titleLabel?.textAlignment = .center
            blueButton.titleLabel?.lineBreakMode = .byWordWrapping
            blueButton.titleLabel?.numberOfLines = 0
            blueButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            blueButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            blueButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
        }
        
        // BLACK BUTTON
        blackButton.center = CGPoint(x: 0.25 * frame.size.width, y: 0.15 * frame.size.height)
        blackButton.setImage(UIImage(named: "BlackSweaterImage"), for: .normal)
        blackButton.tag = 2
        if defaults.bool(forKey: "blackSweaterLocked") == true {
            blackButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            blackButton.backgroundColor = .gray
            blackButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            blackButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 60.0)
            blackButton.titleLabel?.textAlignment = .center
            blackButton.titleLabel?.lineBreakMode = .byWordWrapping
            blackButton.titleLabel?.numberOfLines = 0
            blackButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            blackButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            blackButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
        }
        
        // GOLD BUTTON
        goldButton.center = CGPoint(x: 0.25 * frame.size.width, y: 0.60 * frame.size.height)
        goldButton.setImage(UIImage(named: "GoldSweaterImage"), for: .normal)
        goldButton.tag = 3
        if defaults.bool(forKey: "goldSweaterLocked") == true {
            goldButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            goldButton.backgroundColor = .gray
            goldButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            goldButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 60.0)
            goldButton.titleLabel?.textAlignment = .center
            goldButton.titleLabel?.lineBreakMode = .byWordWrapping
            goldButton.titleLabel?.numberOfLines = 0
            goldButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            goldButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            goldButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
        }
        
        // GRAY BUTTON
        grayButton.center = CGPoint(x: 0.25 * frame.size.width, y: 0.45 * frame.size.height)
        grayButton.setImage(UIImage(named: "GraySweaterImage"), for: .normal)
        grayButton.tag = 4
        if defaults.bool(forKey: "graySweaterLocked") == true {
            grayButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            grayButton.backgroundColor = .gray
            grayButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            grayButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 60.0)
            grayButton.titleLabel?.textAlignment = .center
            grayButton.titleLabel?.lineBreakMode = .byWordWrapping
            grayButton.titleLabel?.numberOfLines = 0
            grayButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            grayButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            grayButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
        }
        
        // HEART BUTTON
        heartButton.center = CGPoint(x: 0.25 * frame.size.width, y: 0.75 * frame.size.height)
        heartButton.setImage(UIImage(named: "HeartSweaterImage"), for: .normal)
        heartButton.tag = 5
        if defaults.bool(forKey: "heartSweaterLocked") == true {
            heartButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            heartButton.backgroundColor = .gray
            heartButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            heartButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 60.0)
            heartButton.titleLabel?.textAlignment = .center
            heartButton.titleLabel?.lineBreakMode = .byWordWrapping
            heartButton.titleLabel?.numberOfLines = 0
            heartButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            heartButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            heartButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
        }
        
        // NAVY BUTTON
        navyButton.center = CGPoint(x: 0.25 * frame.size.width, y: 0.30 * frame.size.height)
        navyButton.setImage(UIImage(named: "NavySweaterImage"), for: .normal)
        navyButton.tag = 6
        if defaults.bool(forKey: "navySweaterLocked") == true {
            navyButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            navyButton.backgroundColor = .gray
            navyButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            navyButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 60.0)
            navyButton.titleLabel?.textAlignment = .center
            navyButton.titleLabel?.lineBreakMode = .byWordWrapping
            navyButton.titleLabel?.numberOfLines = 0
            navyButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            navyButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            navyButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
        }
        
        // RED BUTTON
        redButton.center = CGPoint(x: 0.75 * frame.size.width, y: 0.30 * frame.size.height)
        redButton.setImage(UIImage(named: "RedSweaterImage"), for: .normal)
        redButton.tag = 7
        if defaults.bool(forKey: "redSweaterLocked") == true {
            redButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            redButton.backgroundColor = .gray
            redButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            redButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 60.0)
            redButton.titleLabel?.textAlignment = .center
            redButton.titleLabel?.lineBreakMode = .byWordWrapping
            redButton.titleLabel?.numberOfLines = 0
            redButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            redButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            redButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
        }
        
        // PURPLE BUTTON
        purpleButton.center = CGPoint(x: 0.75 * frame.size.width, y: 0.45 * frame.size.height)
        purpleButton.setImage(UIImage(named: "PurpleSweaterImage"), for: .normal)
        purpleButton.tag = 8
        if defaults.bool(forKey: "purpleSweaterLocked") == true {
            purpleButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            purpleButton.backgroundColor = .gray
            purpleButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            purpleButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 60.0)
            purpleButton.titleLabel?.textAlignment = .center
            purpleButton.titleLabel?.lineBreakMode = .byWordWrapping
            purpleButton.titleLabel?.numberOfLines = 0
            purpleButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            purpleButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            purpleButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
        }
        
        // TREE BUTTON
        treeButton.center = CGPoint(x: 0.75 * frame.size.width, y: 0.75 * frame.size.height)
        treeButton.setImage(UIImage(named: "TreeSweaterImage"), for: .normal)
        treeButton.tag = 9
        if defaults.bool(forKey: "treeSweaterLocked") == true {
            treeButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            treeButton.backgroundColor = .gray
            treeButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            treeButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 60.0)
            treeButton.titleLabel?.textAlignment = .center
            treeButton.titleLabel?.lineBreakMode = .byWordWrapping
            treeButton.titleLabel?.numberOfLines = 0
            treeButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            treeButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            treeButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
        }
        
        // WHITE BUTTON
        whiteButton.center = CGPoint(x: 0.75 * frame.size.width, y: 0.15 * frame.size.height)
        whiteButton.setImage(UIImage(named: "WhiteSweaterImage"), for: .normal)
        whiteButton.tag = 10
        if defaults.bool(forKey: "whiteSweaterLocked") == true {
            whiteButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            whiteButton.backgroundColor = .gray
            whiteButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            whiteButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 60.0)
            whiteButton.titleLabel?.textAlignment = .center
            whiteButton.titleLabel?.lineBreakMode = .byWordWrapping
            whiteButton.titleLabel?.numberOfLines = 0
            whiteButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            whiteButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            whiteButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
        }
        
        // CANCEL BUTTON
        cancelButton.center = CGPoint(x: 0.15 * frame.size.width, y: 0.90 * frame.size.height)
        cancelButton.setBackgroundImage(UIImage(named: "CancelSweaterImage"), for: .normal)
        cancelButton.tag = 11
        cancelButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)

    }
    
    override func didMove(to view: SKView) {
        createBackground()
        maintainHighlight()
        self.view?.addSubview(mainMenuButton)
        self.view?.addSubview(blueButton)
        self.view?.addSubview(blackButton)
        self.view?.addSubview(goldButton)
        self.view?.addSubview(grayButton)
        self.view?.addSubview(purpleButton)
        self.view?.addSubview(heartButton)
        self.view?.addSubview(navyButton)
        self.view?.addSubview(redButton)
        self.view?.addSubview(treeButton)
        self.view?.addSubview(whiteButton)
        self.view?.addSubview(cancelButton)

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
    @objc func backMenu(sender: UIButton!) {
        // HIDE EXISTING LABELS
        for label in [mainMenuButton, blueButton, goldButton, navyButton, grayButton, purpleButton, heartButton, cancelButton, blackButton, redButton, treeButton, whiteButton, acceptButton, denyButton, confirmLabel, notEnoughCoins] {
            label.isHidden = !label.isHidden
        }
        // TRANSITION TO MAIN MENU
        let newScene = CustomizeScene(size: self.size)
        view!.presentScene(newScene)
    }
    
    
    @objc func changeColor(sender: UIButton!) {
        var sweaterColor = String()
        
        if sender.tag == 1 {
            sweaterColor = "BlueSweater"
            highlight(button: sender)
            for label in [blackButton, goldButton, grayButton, heartButton, navyButton, redButton, purpleButton, treeButton, whiteButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 2 {
            sweaterColor = "BlackSweater"
            highlight(button: sender)
             for label in [blueButton, goldButton, grayButton, heartButton, navyButton, redButton, purpleButton, treeButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 3 {
            sweaterColor = "GoldSweater"
            highlight(button: sender)
             for label in [blackButton, blueButton, grayButton, heartButton, navyButton, redButton, purpleButton, treeButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 4 {
            sweaterColor = "GraySweater"
            highlight(button: sender)
             for label in [blackButton, goldButton, blueButton, heartButton, navyButton, redButton, purpleButton, treeButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 5 {
            sweaterColor = "HeartSweater"
            highlight(button: sender)
             for label in [blackButton, goldButton, grayButton, blueButton, navyButton, redButton, purpleButton, treeButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 6 {
            sweaterColor = "NavySweater"
            highlight(button: sender)
             for label in [blackButton, goldButton, grayButton, heartButton, blueButton, redButton, purpleButton, treeButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 7 {
            sweaterColor = "RedSweater"
            highlight(button: sender)
             for label in [blackButton, goldButton, grayButton, heartButton, navyButton, blueButton, purpleButton, treeButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 8 {
            sweaterColor = "PurpleSweater"
            highlight(button: sender)
             for label in [blackButton, goldButton, grayButton, heartButton, navyButton, redButton, blueButton, treeButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 9 {
            sweaterColor = "TreeSweater"
            highlight(button: sender)
             for label in [blackButton, goldButton, grayButton, heartButton, navyButton, redButton, purpleButton, blueButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 10 {
            sweaterColor = "WhiteSweater"
            highlight(button: sender)
             for label in [blackButton, goldButton, grayButton, heartButton, navyButton, redButton, purpleButton, treeButton, blueButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 11 {
            sweaterColor = "NoSweater"
             for label in [blackButton, goldButton, grayButton, heartButton, navyButton, redButton, purpleButton, treeButton, whiteButton, blueButton] {
                 unHighlight(button: label)
             }
        }
        
        defaults.set(sweaterColor, forKey: "sweaterColor")
    }
    
    // BUTTON FEEDBACK
    func highlight(button: UIButton) {
        button.backgroundColor = .lightGray
    }
    
    func unHighlight(button: UIButton) {
        
        if button.backgroundColor == .lightGray {
            button.backgroundColor = .clear
        }
    }
    
    func maintainHighlight() {
        if defaults.string(forKey: "sweaterColor") == "BlueSweater" {
            blueButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "sweaterColor") == "BlackSweater" {
            blackButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "sweaterColor") == "GoldSweater" {
            goldButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "sweaterColor") == "GraySweater" {
            grayButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "sweaterColor") == "HeartSweater" {
            heartButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "sweaterColor") == "NavySweater" {
            navyButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "sweaterColor") == "RedSweater" {
            redButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "sweaterColor") == "PurpleSweater" {
            purpleButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "sweaterColor") == "TreeSweater" {
            treeButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "sweaterColor") == "WhiteSweater" {
            whiteButton.backgroundColor = .lightGray
        }
    }
    
    // PURCHASE SYSTEM
    @objc func confirmPurchase(sender: UIButton!) {
        self.view?.addSubview(confirmLabel)
        self.view?.addSubview(acceptButton)
        self.view?.addSubview(denyButton)
        notEnoughCoins.removeFromSuperview()
        acceptButton.tag = sender.tag
    }
    
    @objc func denyPurchase(sender: UIButton!) {
        for label in [confirmLabel, acceptButton, denyButton] {
            label.removeFromSuperview()
        }
    }
    
    @objc func removeLabel(sender: UIButton!) {
        notEnoughCoins.removeFromSuperview()
    }
    
    @objc func acceptPurchase(sender: UIButton!) {
        for label in [confirmLabel, acceptButton, denyButton] {
            label.removeFromSuperview()
        }
        
        if defaults.integer(forKey: "coins") < price {
            self.view?.addSubview(notEnoughCoins)
        } else {
            var coins = defaults.integer(forKey: "coins")
            coins -= price
            defaults.set(coins, forKey: "coins")
            
            if sender.tag == 1 {
                defaults.set(false, forKey: "blueSweaterLocked")
                defaults.set("BlueSweater", forKey: "sweaterColor")
                highlight(button: blueButton)
                for label in [blackButton, goldButton, grayButton, heartButton, navyButton, redButton, purpleButton, treeButton, whiteButton] {
                    unHighlight(button: label)
                }
                blueButton.setTitle("", for: .normal)
                blueButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                blueButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                blueButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 2 {
                defaults.set(false, forKey: "blackSweaterLocked")
                defaults.set("BlackSweater", forKey: "sweaterColor")
                highlight(button: blackButton)
                for label in [blueButton, goldButton, grayButton, heartButton, navyButton, redButton, purpleButton, treeButton, whiteButton] {
                    unHighlight(button: label)
                }
                blackButton.setTitle("", for: .normal)
                blackButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                blackButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                blackButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 3 {
                defaults.set(false, forKey: "goldSweaterLocked")
                defaults.set("GoldSweater", forKey: "sweaterColor")
                highlight(button: blackButton)
                for label in [blueButton, blackButton, grayButton, heartButton, navyButton, redButton, purpleButton, treeButton, whiteButton] {
                    unHighlight(button: label)
                }
                goldButton.setTitle("", for: .normal)
                goldButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                goldButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                goldButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 4 {
                defaults.set(false, forKey: "graySweaterLocked")
                defaults.set("GraySweater", forKey: "sweaterColor")
                highlight(button: grayButton)
                for label in [blueButton, goldButton, blackButton, heartButton, navyButton, redButton, purpleButton, treeButton, whiteButton] {
                    unHighlight(button: label)
                }
                grayButton.setTitle("", for: .normal)
                grayButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                grayButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                grayButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 5 {
                defaults.set(false, forKey: "heartSweaterLocked")
                defaults.set("HeartSweater", forKey: "sweaterColor")
                highlight(button: heartButton)
                for label in [blueButton, goldButton, grayButton, blackButton, navyButton, redButton, purpleButton, treeButton, whiteButton] {
                    unHighlight(button: label)
                }
                heartButton.setTitle("", for: .normal)
                heartButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                heartButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                heartButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 6 {
                defaults.set(false, forKey: "navySweaterLocked")
                defaults.set("NavySweater", forKey: "sweaterColor")
                highlight(button: navyButton)
                for label in [blueButton, goldButton, grayButton, heartButton, blackButton, redButton, purpleButton, treeButton, whiteButton] {
                    unHighlight(button: label)
                }
                navyButton.setTitle("", for: .normal)
                navyButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                navyButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                navyButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 7 {
                defaults.set(false, forKey: "redSweaterLocked")
                defaults.set("RedSweater", forKey: "sweaterColor")
                highlight(button: redButton)
                for label in [blueButton, goldButton, grayButton, heartButton, navyButton, blackButton, purpleButton, treeButton, whiteButton] {
                    unHighlight(button: label)
                }
                redButton.setTitle("", for: .normal)
                redButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                redButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                redButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 8 {
                defaults.set(false, forKey: "purpleSweaterLocked")
                defaults.set("PurpleSweater", forKey: "sweaterColor")
                highlight(button: purpleButton)
                for label in [blueButton, goldButton, grayButton, heartButton, navyButton, redButton, blackButton, treeButton, whiteButton] {
                    unHighlight(button: label)
                }
                purpleButton.setTitle("", for: .normal)
                purpleButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                purpleButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                purpleButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 9 {
                defaults.set(false, forKey: "treeSweaterLocked")
                defaults.set("TreeSweater", forKey: "sweaterColor")
                highlight(button: treeButton)
                for label in [blueButton, goldButton, grayButton, heartButton, navyButton, redButton, purpleButton, blackButton, whiteButton] {
                    unHighlight(button: label)
                }
                treeButton.setTitle("", for: .normal)
                treeButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                treeButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                treeButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 10 {
                defaults.set(false, forKey: "whiteSweaterLocked")
                defaults.set("WhiteSweater", forKey: "sweaterColor")
                highlight(button: whiteButton)
                for label in [blueButton, goldButton, grayButton, heartButton, navyButton, redButton, purpleButton, treeButton, blackButton] {
                    unHighlight(button: label)
                }
                whiteButton.setTitle("", for: .normal)
                whiteButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                whiteButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                whiteButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            }
        }
    }
    
}




