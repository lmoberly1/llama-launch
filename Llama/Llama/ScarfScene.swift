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

class ScarfScene: SKScene {
    
    let defaults = UserDefaults.standard
    let price: Int = 150
    
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
    let pinkButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let navyButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let redButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let purpleButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let greenButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let whiteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 90))
    let cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 90))

    
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
        blueButton.setImage(UIImage(named: "BlueScarf"), for: .normal)
        blueButton.tag = 1
        if defaults.bool(forKey: "blueScarfLocked") == true {
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
        blackButton.setImage(UIImage(named: "BlackScarf"), for: .normal)
        blackButton.tag = 2
        if defaults.bool(forKey: "blackScarfLocked") == true {
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
        goldButton.setImage(UIImage(named: "GoldScarf"), for: .normal)
        goldButton.tag = 3
        if defaults.bool(forKey: "goldScarfLocked") == true {
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
        grayButton.setImage(UIImage(named: "GrayScarf"), for: .normal)
        grayButton.tag = 4
        if defaults.bool(forKey: "grayScarfLocked") == true {
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
        
        // PINK BUTTON
        pinkButton.center = CGPoint(x: 0.25 * frame.size.width, y: 0.75 * frame.size.height)
        pinkButton.setImage(UIImage(named: "PinkScarf"), for: .normal)
        pinkButton.tag = 5
        if defaults.bool(forKey: "pinkScarfLocked") == true {
            pinkButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            pinkButton.backgroundColor = .gray
            pinkButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            pinkButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 60.0)
            pinkButton.titleLabel?.textAlignment = .center
            pinkButton.titleLabel?.lineBreakMode = .byWordWrapping
            pinkButton.titleLabel?.numberOfLines = 0
            pinkButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            pinkButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            pinkButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
        }
        
        // NAVY BUTTON
        navyButton.center = CGPoint(x: 0.25 * frame.size.width, y: 0.30 * frame.size.height)
        navyButton.setImage(UIImage(named: "NavyScarf"), for: .normal)
        navyButton.tag = 6
        if defaults.bool(forKey: "navyScarfLocked") == true {
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
        redButton.setImage(UIImage(named: "RedScarf"), for: .normal)
        redButton.tag = 7
        if defaults.bool(forKey: "redScarfLocked") == true {
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
        purpleButton.setImage(UIImage(named: "PurpleScarf"), for: .normal)
        purpleButton.tag = 8
        if defaults.bool(forKey: "purpleScarfLocked") == true {
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
        
        // GREEN BUTTON
        greenButton.center = CGPoint(x: 0.75 * frame.size.width, y: 0.75 * frame.size.height)
        greenButton.setImage(UIImage(named: "GreenScarf"), for: .normal)
        greenButton.tag = 9
        if defaults.bool(forKey: "greenScarfLocked") == true {
            greenButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            greenButton.backgroundColor = .gray
            greenButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            greenButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 60.0)
            greenButton.titleLabel?.textAlignment = .center
            greenButton.titleLabel?.lineBreakMode = .byWordWrapping
            greenButton.titleLabel?.numberOfLines = 0
            greenButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            greenButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            greenButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
        }
        
        // WHITE BUTTON
        whiteButton.center = CGPoint(x: 0.75 * frame.size.width, y: 0.15 * frame.size.height)
        whiteButton.setImage(UIImage(named: "WhiteScarf"), for: .normal)
        whiteButton.tag = 10
        if defaults.bool(forKey: "whiteScarfLocked") == true {
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
        cancelButton.setBackgroundImage(UIImage(named: "CancelScarf"), for: .normal)
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
        self.view?.addSubview(pinkButton)
        self.view?.addSubview(navyButton)
        self.view?.addSubview(redButton)
        self.view?.addSubview(greenButton)
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
        for label in [mainMenuButton, blueButton, goldButton, navyButton, grayButton, purpleButton, pinkButton, cancelButton, blackButton, redButton, greenButton, whiteButton, acceptButton, denyButton, confirmLabel, notEnoughCoins] {
            label.isHidden = !label.isHidden
        }
        // TRANSITION TO MAIN MENU
        let newScene = CustomizeScene(size: self.size)
        view!.presentScene(newScene)
    }
    
    
    @objc func changeColor(sender: UIButton!) {
        var ScarfColor = String()
        
        if sender.tag == 1 {
            ScarfColor = "BlueScarf"
            highlight(button: sender)
            for label in [blackButton, goldButton, grayButton, pinkButton, navyButton, redButton, purpleButton, greenButton, whiteButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 2 {
            ScarfColor = "BlackScarf"
            highlight(button: sender)
             for label in [blueButton, goldButton, grayButton, pinkButton, navyButton, redButton, purpleButton, greenButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 3 {
            ScarfColor = "GoldScarf"
            highlight(button: sender)
             for label in [blackButton, blueButton, grayButton, pinkButton, navyButton, redButton, purpleButton, greenButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 4 {
            ScarfColor = "GrayScarf"
            highlight(button: sender)
             for label in [blackButton, goldButton, blueButton, pinkButton, navyButton, redButton, purpleButton, greenButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 5 {
            ScarfColor = "PinkScarf"
            highlight(button: sender)
             for label in [blackButton, goldButton, grayButton, blueButton, navyButton, redButton, purpleButton, greenButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 6 {
            ScarfColor = "NavyScarf"
            highlight(button: sender)
             for label in [blackButton, goldButton, grayButton, pinkButton, blueButton, redButton, purpleButton, greenButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 7 {
            ScarfColor = "RedScarf"
            highlight(button: sender)
             for label in [blackButton, goldButton, grayButton, pinkButton, navyButton, blueButton, purpleButton, greenButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 8 {
            ScarfColor = "PurpleScarf"
            highlight(button: sender)
             for label in [blackButton, goldButton, grayButton, pinkButton, navyButton, redButton, blueButton, greenButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 9 {
            ScarfColor = "GreenScarf"
            highlight(button: sender)
             for label in [blackButton, goldButton, grayButton, pinkButton, navyButton, redButton, purpleButton, blueButton, whiteButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 10 {
            ScarfColor = "WhiteScarf"
            highlight(button: sender)
             for label in [blackButton, goldButton, grayButton, pinkButton, navyButton, redButton, purpleButton, greenButton, blueButton] {
                 unHighlight(button: label)
             }
        } else if sender.tag == 11 {
            ScarfColor = "NoScarf"
             for label in [blackButton, goldButton, grayButton, pinkButton, navyButton, redButton, purpleButton, greenButton, whiteButton, blueButton] {
                 unHighlight(button: label)
             }
        }
        
        defaults.set(ScarfColor, forKey: "scarfColor")
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
        if defaults.string(forKey: "scarfColor") == "BlueScarf" {
            blueButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "scarfColor") == "BlackScarf" {
            blackButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "scarfColor") == "GoldScarf" {
            goldButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "scarfColor") == "GrayScarf" {
            grayButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "scarfColor") == "PinkScarf" {
            pinkButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "scarfColor") == "NavyScarf" {
            navyButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "scarfColor") == "RedScarf" {
            redButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "scarfColor") == "PurpleScarf" {
            purpleButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "scarfColor") == "GreenScarf" {
            greenButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "scarfColor") == "WhiteScarf" {
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
                defaults.set(false, forKey: "blueScarfLocked")
                defaults.set("BlueScarf", forKey: "scarfColor")
                highlight(button: blueButton)
                for label in [blackButton, goldButton, grayButton, pinkButton, navyButton, redButton, purpleButton, greenButton, whiteButton] {
                    unHighlight(button: label)
                }
                blueButton.setTitle("", for: .normal)
                blueButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                blueButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                blueButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 2 {
                defaults.set(false, forKey: "blackScarfLocked")
                defaults.set("BlackScarf", forKey: "scarfColor")
                highlight(button: blackButton)
                for label in [blueButton, goldButton, grayButton, pinkButton, navyButton, redButton, purpleButton, greenButton, whiteButton] {
                    unHighlight(button: label)
                }
                blackButton.setTitle("", for: .normal)
                blackButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                blackButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                blackButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 3 {
                defaults.set(false, forKey: "goldScarfLocked")
                defaults.set("GoldScarf", forKey: "scarfColor")
                highlight(button: blackButton)
                for label in [blueButton, blackButton, grayButton, pinkButton, navyButton, redButton, purpleButton, greenButton, whiteButton] {
                    unHighlight(button: label)
                }
                goldButton.setTitle("", for: .normal)
                goldButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                goldButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                goldButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 4 {
                defaults.set(false, forKey: "grayScarfLocked")
                defaults.set("GrayScarf", forKey: "scarfColor")
                highlight(button: grayButton)
                for label in [blueButton, goldButton, blackButton, pinkButton, navyButton, redButton, purpleButton, greenButton, whiteButton] {
                    unHighlight(button: label)
                }
                grayButton.setTitle("", for: .normal)
                grayButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                grayButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                grayButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 5 {
                defaults.set(false, forKey: "pinkScarfLocked")
                defaults.set("PinkScarf", forKey: "scarfColor")
                highlight(button: pinkButton)
                for label in [blueButton, goldButton, grayButton, blackButton, navyButton, redButton, purpleButton, greenButton, whiteButton] {
                    unHighlight(button: label)
                }
                pinkButton.setTitle("", for: .normal)
                pinkButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                pinkButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                pinkButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 6 {
                defaults.set(false, forKey: "navyScarfLocked")
                defaults.set("NavyScarf", forKey: "scarfColor")
                highlight(button: navyButton)
                for label in [blueButton, goldButton, grayButton, pinkButton, blackButton, redButton, purpleButton, greenButton, whiteButton] {
                    unHighlight(button: label)
                }
                navyButton.setTitle("", for: .normal)
                navyButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                navyButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                navyButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 7 {
                defaults.set(false, forKey: "redScarfLocked")
                defaults.set("RedScarf", forKey: "scarfColor")
                highlight(button: redButton)
                for label in [blueButton, goldButton, grayButton, pinkButton, navyButton, blackButton, purpleButton, greenButton, whiteButton] {
                    unHighlight(button: label)
                }
                redButton.setTitle("", for: .normal)
                redButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                redButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                redButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 8 {
                defaults.set(false, forKey: "purpleScarfLocked")
                defaults.set("PurpleScarf", forKey: "scarfColor")
                highlight(button: purpleButton)
                for label in [blueButton, goldButton, grayButton, pinkButton, navyButton, redButton, blackButton, greenButton, whiteButton] {
                    unHighlight(button: label)
                }
                purpleButton.setTitle("", for: .normal)
                purpleButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                purpleButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                purpleButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 9 {
                defaults.set(false, forKey: "greenScarfLocked")
                defaults.set("GreenScarf", forKey: "scarfColor")
                highlight(button: greenButton)
                for label in [blueButton, goldButton, grayButton, pinkButton, navyButton, redButton, purpleButton, blackButton, whiteButton] {
                    unHighlight(button: label)
                }
                greenButton.setTitle("", for: .normal)
                greenButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
                greenButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                greenButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 10 {
                defaults.set(false, forKey: "whiteScarfLocked")
                defaults.set("WhiteScarf", forKey: "scarfColor")
                highlight(button: whiteButton)
                for label in [blueButton, goldButton, grayButton, pinkButton, navyButton, redButton, purpleButton, greenButton, blackButton] {
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





