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

class HatScene: SKScene {
    
    let defaults = UserDefaults.standard
    let price: Int = 100
    
    // BUTTONS
    let mainMenuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 50))
    let acceptButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 75))
    let denyButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 75))
    let confirmLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 75))
    let notEnoughCoins = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 150))
    
    let redButton = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 85))
    let purpleButton = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 85))
    let grayButton = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 85))
    let greenButton = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 85))
    let goldButton = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 85))
    let pinkButton = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 85))
    let turqButton = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 85))
    let whiteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 85))
    let blueButton = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 85))
    let blackButton = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 85))
    let cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 70, height: 70))

    
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
        
        // RED BUTTON
        redButton.center = CGPoint(x: 0.25 * frame.size.width, y: 0.15 * frame.size.height)
        redButton.setImage(UIImage(named: "RedHat"), for: .normal)
        redButton.tag = 1
        if defaults.bool(forKey: "redHatLocked") == true {
            redButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            redButton.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -10.0)
            redButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -5.0, bottom: 0.0, right: 0.0)
            redButton.backgroundColor = .gray
            redButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            redButton.titleLabel?.textAlignment = .center
            redButton.titleLabel?.lineBreakMode = .byWordWrapping
            redButton.titleLabel?.numberOfLines = 0
            redButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            redButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        }
        
        // GOLD BUTTON
        goldButton.center = CGPoint(x: 0.25 * frame.size.width, y: 0.30 * frame.size.height)
        goldButton.setImage(UIImage(named: "GoldHat"), for: .normal)
        goldButton.tag = 2
        if defaults.bool(forKey: "goldHatLocked") == true {
            goldButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            goldButton.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -10.0)
            goldButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -5.0, bottom: 0.0, right: 0.0)
            goldButton.backgroundColor = .gray
            goldButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            goldButton.titleLabel?.textAlignment = .center
            goldButton.titleLabel?.lineBreakMode = .byWordWrapping
            goldButton.titleLabel?.numberOfLines = 0
            goldButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            goldButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        }
        
        // GREEN BUTTON
        greenButton.center = CGPoint(x: 0.25 * frame.size.width, y: 0.45 * frame.size.height)
        greenButton.setImage(UIImage(named: "GreenHat"), for: .normal)
        greenButton.tag = 3
        if defaults.bool(forKey: "greenHatLocked") == true {
            greenButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            greenButton.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -10.0)
            greenButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -5.0, bottom: 0.0, right: 0.0)
            greenButton.backgroundColor = .gray
            greenButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            greenButton.titleLabel?.textAlignment = .center
            greenButton.titleLabel?.lineBreakMode = .byWordWrapping
            greenButton.titleLabel?.numberOfLines = 0
            greenButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            greenButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        }
        
        
        // PINK BUTTON
        pinkButton.center = CGPoint(x: 0.25 * frame.size.width, y: 0.60 * frame.size.height)
        pinkButton.setImage(UIImage(named: "PinkHat"), for: .normal)
        pinkButton.tag = 4
        if defaults.bool(forKey: "pinkHatLocked") == true {
            pinkButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            pinkButton.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -10.0)
            pinkButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -5.0, bottom: 0.0, right: 0.0)
            pinkButton.backgroundColor = .gray
            pinkButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            pinkButton.titleLabel?.textAlignment = .center
            pinkButton.titleLabel?.lineBreakMode = .byWordWrapping
            pinkButton.titleLabel?.numberOfLines = 0
            pinkButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            pinkButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        }
        
        // PURPLE BUTTON
        purpleButton.center = CGPoint(x: 0.25 * frame.size.width, y: 0.75 * frame.size.height)
        purpleButton.setImage(UIImage(named: "PurpleHat"), for: .normal)
        purpleButton.tag = 5
        if defaults.bool(forKey: "purpleHatLocked") == true {
            purpleButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            purpleButton.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -10.0)
            purpleButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -5.0, bottom: 0.0, right: 0.0)
            purpleButton.backgroundColor = .gray
            purpleButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            purpleButton.titleLabel?.textAlignment = .center
            purpleButton.titleLabel?.lineBreakMode = .byWordWrapping
            purpleButton.titleLabel?.numberOfLines = 0
            purpleButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            purpleButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        }
        
        // WHITE BUTTON
        whiteButton.center = CGPoint(x: 0.75 * frame.size.width, y: 0.15 * frame.size.height)
        whiteButton.setImage(UIImage(named: "WhiteHat"), for: .normal)
        whiteButton.tag = 6
        if defaults.bool(forKey: "whiteHatLocked") == true {
            whiteButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            whiteButton.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -10.0)
            whiteButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -5.0, bottom: 0.0, right: 0.0)
            whiteButton.backgroundColor = .gray
            whiteButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            whiteButton.titleLabel?.textAlignment = .center
            whiteButton.titleLabel?.lineBreakMode = .byWordWrapping
            whiteButton.titleLabel?.numberOfLines = 0
            whiteButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            whiteButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        }
        
        // BLACK BUTTON
        blackButton.center = CGPoint(x: 0.75 * frame.size.width, y: 0.30 * frame.size.height)
        blackButton.setImage(UIImage(named: "BlackHat"), for: .normal)
        blackButton.tag = 7
        if defaults.bool(forKey: "blackHatLocked") == true {
            blackButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            blackButton.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -10.0)
            blackButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -5.0, bottom: 0.0, right: 0.0)
            blackButton.backgroundColor = .gray
            blackButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            blackButton.titleLabel?.textAlignment = .center
            blackButton.titleLabel?.lineBreakMode = .byWordWrapping
            blackButton.titleLabel?.numberOfLines = 0
            blackButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            blackButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        }
        
        // BLUE BUTTON
        blueButton.center = CGPoint(x: 0.75 * frame.size.width, y: 0.45 * frame.size.height)
        blueButton.setImage(UIImage(named: "BlueHat"), for: .normal)
        blueButton.tag = 8
        if defaults.bool(forKey: "blueHatLocked") == true {
            blueButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            blueButton.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -10.0)
            blueButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -5.0, bottom: 0.0, right: 0.0)
            blueButton.backgroundColor = .gray
            blueButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            blueButton.titleLabel?.textAlignment = .center
            blueButton.titleLabel?.lineBreakMode = .byWordWrapping
            blueButton.titleLabel?.numberOfLines = 0
            blueButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            blueButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        }
        
        // GRAY BUTTON
        grayButton.center = CGPoint(x: 0.75 * frame.size.width, y: 0.60 * frame.size.height)
        grayButton.setImage(UIImage(named: "GrayHat"), for: .normal)
        grayButton.tag = 9
        if defaults.bool(forKey: "grayHatLocked") == true {
            grayButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            grayButton.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -10.0)
            grayButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -5.0, bottom: 0.0, right: 0.0)
            grayButton.backgroundColor = .gray
            grayButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            grayButton.titleLabel?.textAlignment = .center
            grayButton.titleLabel?.lineBreakMode = .byWordWrapping
            grayButton.titleLabel?.numberOfLines = 0
            grayButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            grayButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        }
        
        // TURQ BUTTON
        turqButton.center = CGPoint(x: 0.75 * frame.size.width, y: 0.75 * frame.size.height)
        turqButton.setImage(UIImage(named: "TurqHat"), for: .normal)
        turqButton.tag = 10
        if defaults.bool(forKey: "turqHatLocked") == true {
            turqButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            turqButton.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -10.0)
            turqButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -5.0, bottom: 0.0, right: 0.0)
            turqButton.backgroundColor = .gray
            turqButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            turqButton.titleLabel?.textAlignment = .center
            turqButton.titleLabel?.lineBreakMode = .byWordWrapping
            turqButton.titleLabel?.numberOfLines = 0
            turqButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            turqButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        }
        
        // CANCEL BUTTON
        cancelButton.center = CGPoint(x: 0.15 * frame.size.width, y: 0.90 * frame.size.height)
        cancelButton.setBackgroundImage(UIImage(named: "CancelHat"), for: .normal)
        cancelButton.tag = 11
        cancelButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)

    }
    
    override func didMove(to view: SKView) {
        createBackground()
        maintainHighlight()
        self.view?.addSubview(mainMenuButton)
        self.view?.addSubview(redButton)
        self.view?.addSubview(greenButton)
        self.view?.addSubview(goldButton)
        self.view?.addSubview(pinkButton)
        self.view?.addSubview(purpleButton)
        self.view?.addSubview(grayButton)
        self.view?.addSubview(blueButton)
        self.view?.addSubview(blackButton)
        self.view?.addSubview(turqButton)
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
        for label in [mainMenuButton, redButton, goldButton, greenButton, blueButton, purpleButton, grayButton, whiteButton, blackButton, turqButton, pinkButton, cancelButton, acceptButton, denyButton, confirmLabel, notEnoughCoins] {
            label.isHidden = !label.isHidden
        }
        // TRANSITION TO MAIN MENU
        let newScene = CustomizeScene(size: self.size)
        view!.presentScene(newScene)
    }
    
    
    @objc func changeColor(sender: UIButton!) {
        var hatColor = String()
        
        if sender.tag == 1 {
            hatColor = "RedHat"
            highlight(button: sender)
            for label in [goldButton, greenButton, pinkButton, purpleButton, whiteButton, blackButton, blueButton, grayButton, turqButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 2 {
            hatColor = "GoldHat"
            highlight(button: sender)
            for label in [redButton, greenButton, pinkButton, purpleButton, whiteButton, blackButton, blueButton, grayButton, turqButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 3 {
            hatColor = "GreenHat"
            highlight(button: sender)
            for label in [goldButton, redButton, pinkButton, purpleButton, whiteButton, blackButton, blueButton, grayButton, turqButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 4 {
            hatColor = "PinkHat"
            highlight(button: sender)
            for label in [goldButton, greenButton, redButton, purpleButton, whiteButton, blackButton, blueButton, grayButton, turqButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 5 {
            hatColor = "PurpleHat"
            highlight(button: sender)
            for label in [goldButton, greenButton, pinkButton, redButton, whiteButton, blackButton, blueButton, grayButton, turqButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 6 {
            hatColor = "WhiteHat"
            highlight(button: sender)
            for label in [goldButton, greenButton, pinkButton, purpleButton, redButton, blackButton, blueButton, grayButton, turqButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 7 {
            hatColor = "BlackHat"
            highlight(button: sender)
            for label in [goldButton, greenButton, pinkButton, purpleButton, whiteButton, redButton, blueButton, grayButton, turqButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 8 {
            hatColor = "BlueHat"
            highlight(button: sender)
            for label in [goldButton, greenButton, pinkButton, purpleButton, whiteButton, blackButton, redButton, grayButton, turqButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 9 {
            hatColor = "GrayHat"
            highlight(button: sender)
            for label in [goldButton, greenButton, pinkButton, purpleButton, whiteButton, blackButton, blueButton, redButton, turqButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 10 {
            hatColor = "TurqHat"
            highlight(button: sender)
            for label in [goldButton, greenButton, pinkButton, purpleButton, whiteButton, blackButton, blueButton, grayButton, redButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 11 {
            hatColor = "NoHat"
            for label in [goldButton, greenButton, pinkButton, purpleButton, whiteButton, blackButton, blueButton, grayButton, redButton, turqButton] {
                unHighlight(button: label)
            }
        }
        
        defaults.set(hatColor, forKey: "hatColor")
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
        if defaults.string(forKey: "hatColor") == "RedHat" {
            redButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "hatColor") == "GoldHat" {
            goldButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "hatColor") == "GreenHat" {
            greenButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "hatColor") == "PinkHat" {
            pinkButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "hatColor") == "PurpleHat" {
            purpleButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "hatColor") == "WhiteHat" {
            whiteButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "hatColor") == "BlackHat" {
            blackButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "hatColor") == "BlueHat" {
            blueButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "hatColor") == "GrayHat" {
            grayButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "hatColor") == "TurqHat" {
            turqButton.backgroundColor = .lightGray
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
                defaults.set(false, forKey: "redHatLocked")
                defaults.set("RedHat", forKey: "hatColor")
                highlight(button: redButton)
                for label in [goldButton, greenButton, pinkButton, purpleButton, whiteButton, blackButton, blueButton, grayButton, turqButton] {
                    unHighlight(button: label)
                }
                redButton.setTitle("", for: .normal)
                redButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                redButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                redButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 2 {
                defaults.set(false, forKey: "goldHatLocked")
                defaults.set("GoldHat", forKey: "hatColor")
                highlight(button: goldButton)
                for label in [redButton, greenButton, pinkButton, purpleButton, whiteButton, blackButton, blueButton, grayButton, turqButton] {
                    unHighlight(button: label)
                }
                goldButton.setTitle("", for: .normal)
                goldButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                goldButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                goldButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 3 {
                defaults.set(false, forKey: "greenHatLocked")
                defaults.set("GreenHat", forKey: "hatColor")
                highlight(button: greenButton)
                for label in [goldButton, redButton, pinkButton, purpleButton, whiteButton, blackButton, blueButton, grayButton, turqButton] {
                    unHighlight(button: label)
                }
                greenButton.setTitle("", for: .normal)
                greenButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                greenButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                greenButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 4 {
                defaults.set(false, forKey: "pinkHatLocked")
                defaults.set("PinkHat", forKey: "hatColor")
                highlight(button: pinkButton)
                for label in [goldButton, greenButton, redButton, purpleButton, whiteButton, blackButton, blueButton, grayButton, turqButton] {
                    unHighlight(button: label)
                }
                pinkButton.setTitle("", for: .normal)
                pinkButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                pinkButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                pinkButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 5 {
                defaults.set(false, forKey: "purpleHatLocked")
                defaults.set("PurpleHat", forKey: "hatColor")
                highlight(button: purpleButton)
                for label in [goldButton, greenButton, pinkButton, redButton, whiteButton, blackButton, blueButton, grayButton, turqButton] {
                    unHighlight(button: label)
                }
                purpleButton.setTitle("", for: .normal)
                purpleButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                purpleButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                purpleButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 6 {
                defaults.set(false, forKey: "whiteHatLocked")
                defaults.set("WhiteHat", forKey: "hatColor")
                highlight(button: whiteButton)
                for label in [goldButton, greenButton, pinkButton, purpleButton, redButton, blackButton, blueButton, grayButton, turqButton] {
                    unHighlight(button: label)
                }
                whiteButton.setTitle("", for: .normal)
                whiteButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                whiteButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                whiteButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 7 {
                defaults.set(false, forKey: "blackHatLocked")
                defaults.set("BlackHat", forKey: "hatColor")
                highlight(button: blackButton)
                for label in [goldButton, greenButton, pinkButton, purpleButton, whiteButton, redButton, blueButton, grayButton, turqButton] {
                    unHighlight(button: label)
                }
                blackButton.setTitle("", for: .normal)
                blackButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                blackButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                blackButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 8 {
                defaults.set(false, forKey: "blueHatLocked")
                defaults.set("BlueHat", forKey: "hatColor")
                highlight(button: blueButton)
                for label in [goldButton, greenButton, pinkButton, purpleButton, whiteButton, blackButton, redButton, grayButton, turqButton] {
                    unHighlight(button: label)
                }
                blueButton.setTitle("", for: .normal)
                blueButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                blueButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                blueButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 9 {
                defaults.set(false, forKey: "grayHatLocked")
                defaults.set("GrayHat", forKey: "hatColor")
                highlight(button: grayButton)
                for label in [goldButton, greenButton, pinkButton, purpleButton, whiteButton, blackButton, blueButton, redButton, turqButton] {
                    unHighlight(button: label)
                }
                grayButton.setTitle("", for: .normal)
                grayButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                grayButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                grayButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 10 {
                defaults.set(false, forKey: "turqHatLocked")
                defaults.set("TurqHat", forKey: "hatColor")
                highlight(button: turqButton)
                for label in [goldButton, greenButton, pinkButton, purpleButton, whiteButton, blackButton, blueButton, grayButton, redButton] {
                    unHighlight(button: label)
                }
                turqButton.setTitle("", for: .normal)
                turqButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                turqButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                turqButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            }
        }
    }
    
    
    
}




