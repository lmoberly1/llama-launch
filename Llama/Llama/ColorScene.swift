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

class ColorScene: SKScene {
        
    let defaults = UserDefaults.standard
    var isChecked = false
    let price: Int = 250
    
    // BUTTONS
    let mainMenuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 125, height: 50))
    let acceptButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 75))
    let denyButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 75))
    let confirmLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 75))
    let notEnoughCoins = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 150))

    let redButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
    let greenButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
    let yellowButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
    let purpleButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
    let grayButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
    let blueButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 150))
    
    // TEXTURES
    let backgroundTexture = SKTexture(imageNamed: "background")
    
    
    // SCENE LOAD
    override func sceneDidLoad() {
        
//        let widthMultiplier = self.frame.size.width/375
//        let heightMultiplier = self.frame.size.height/667
//        
//        for label in [mainMenuButton, redButton, yellowButton, greenButton, blueButton, purpleButton, grayButton] {
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
        redButton.center = CGPoint(x: 0.25 * frame.size.width, y: 0.20 * frame.size.height)
        redButton.setImage(UIImage(named: "RedLeaping"), for: .normal)
        redButton.tag = 1
        if defaults.bool(forKey: "redColorLocked") == true {
            redButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            redButton.backgroundColor = .gray
            redButton.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -60.0, bottom: -20.0, right: 0.0)
            redButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -50.0)
            redButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            redButton.titleLabel?.textAlignment = .center
            redButton.titleLabel?.lineBreakMode = .byWordWrapping
            redButton.titleLabel?.numberOfLines = 0
            redButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            redButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        }
        
        // YELLOW BUTTON
        yellowButton.center = CGPoint(x: 0.25 * frame.size.width, y: 0.45 * frame.size.height)
        yellowButton.setImage(UIImage(named: "YellowLeaping"), for: .normal)
        yellowButton.tag = 2
        if defaults.bool(forKey: "yellowColorLocked") == true {
            yellowButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            yellowButton.backgroundColor = .gray
            yellowButton.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -60.0, bottom: -20.0, right: 0.0)
            yellowButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -50.0)
            yellowButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            yellowButton.titleLabel?.textAlignment = .center
            yellowButton.titleLabel?.lineBreakMode = .byWordWrapping
            yellowButton.titleLabel?.numberOfLines = 0
            yellowButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            yellowButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        }
        
        // GREEN BUTTON
        greenButton.center = CGPoint(x: 0.25 * frame.size.width, y: 0.70 * frame.size.height)
        greenButton.setImage(UIImage(named: "GreenLeaping"), for: .normal)
        greenButton.tag = 3
        if defaults.bool(forKey: "greenColorLocked") == true {
            greenButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            greenButton.backgroundColor = .gray
            greenButton.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -60.0, bottom: -20.0, right: 0.0)
            greenButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -50.0)
            greenButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            greenButton.titleLabel?.textAlignment = .center
            greenButton.titleLabel?.lineBreakMode = .byWordWrapping
            greenButton.titleLabel?.numberOfLines = 0
            greenButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            greenButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        }
        
        // BLUE BUTTON
        blueButton.center = CGPoint(x: 0.75 * frame.size.width, y: 0.20 * frame.size.height)
        blueButton.setImage(UIImage(named: "BlueLeaping"), for: .normal)
        blueButton.tag = 4
        blueButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        
        // PURPLE BUTTON
        purpleButton.center = CGPoint(x: 0.75 * frame.size.width, y: 0.45 * frame.size.height)
        purpleButton.setImage(UIImage(named: "PurpleLeaping"), for: .normal)
        purpleButton.tag = 5
        if defaults.bool(forKey: "purpleColorLocked") == true {
            purpleButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            purpleButton.backgroundColor = .gray
            purpleButton.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -60.0, bottom: -20.0, right: 0.0)
            purpleButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -50.0)
            purpleButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            purpleButton.titleLabel?.textAlignment = .center
            purpleButton.titleLabel?.lineBreakMode = .byWordWrapping
            purpleButton.titleLabel?.numberOfLines = 0
            purpleButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            purpleButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        }
        
        // GRAY BUTTON
        grayButton.center = CGPoint(x: 0.75 * frame.size.width, y: 0.70 * frame.size.height)
        grayButton.setImage(UIImage(named: "GrayLeaping"), for: .normal)
        grayButton.tag = 6
        if defaults.bool(forKey: "grayColorLocked") == true {
            grayButton.addTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
            grayButton.backgroundColor = .gray
            grayButton.titleEdgeInsets = UIEdgeInsets.init(top: 0.0, left: -60.0, bottom: -20.0, right: 0.0)
            grayButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: -50.0)
            grayButton.setTitle("\(price)\nSpit\nCoin", for: .normal)
            grayButton.titleLabel?.textAlignment = .center
            grayButton.titleLabel?.lineBreakMode = .byWordWrapping
            grayButton.titleLabel?.numberOfLines = 0
            grayButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 20)
        } else {
            grayButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        }

    }
    
    override func didMove(to view: SKView) {
        createBackground()
        maintainHighlight()
        self.view?.addSubview(mainMenuButton)
        self.view?.addSubview(redButton)
        self.view?.addSubview(greenButton)
        self.view?.addSubview(yellowButton)
        self.view?.addSubview(purpleButton)
        self.view?.addSubview(grayButton)
        self.view?.addSubview(blueButton)
        
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
        for label in [mainMenuButton, redButton, yellowButton, greenButton, blueButton, purpleButton, grayButton, confirmLabel, acceptButton, denyButton, notEnoughCoins] {
            label.isHidden = !label.isHidden
        }
        // TRANSITION TO MAIN MENU
        let newScene = CustomizeScene(size: self.size)
        view!.presentScene(newScene)
    }

    
    // CHANGE COLORS
    @objc func changeColor(sender: UIButton!) {
        var standingColor = String()
        var leapingColor = String()
    
        if sender.tag == 1 {
            standingColor = "RedStanding"
            leapingColor = "RedLeaping"
            highlight(button: sender)
            for label in [yellowButton, greenButton, blueButton, purpleButton, grayButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 2 {
            standingColor = "YellowStanding"
            leapingColor = "YellowLeaping"
            highlight(button: sender)
            for label in [redButton, greenButton, blueButton, purpleButton, grayButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 3 {
            standingColor = "GreenStanding"
            leapingColor = "GreenLeaping"
            highlight(button: sender)
            for label in [redButton, yellowButton, blueButton, purpleButton, grayButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 4 {
            standingColor = "BlueStanding"
            leapingColor = "BlueLeaping"
            highlight(button: sender)
            for label in [yellowButton, greenButton, redButton, purpleButton, grayButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 5 {
            standingColor = "PurpleStanding"
            leapingColor = "PurpleLeaping"
            highlight(button: sender)
            for label in [yellowButton, greenButton, blueButton, redButton, grayButton] {
                unHighlight(button: label)
            }
        } else if sender.tag == 6 {
            standingColor = "GrayStanding"
            leapingColor = "GrayLeaping"
            highlight(button: sender)
            for label in [yellowButton, greenButton, blueButton, purpleButton, redButton] {
                unHighlight(button: label)
            }
        }
        
        defaults.set(standingColor, forKey: "llamaStandingColor")
        defaults.set(leapingColor, forKey: "llamaLeapingColor")
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
        if defaults.string(forKey: "llamaStandingColor") == "RedStanding" {
            redButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "llamaStandingColor") == "YellowStanding" {
            yellowButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "llamaStandingColor") == "GreenStanding" {
            greenButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "llamaStandingColor") == "PurpleStanding" {
            purpleButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "llamaStandingColor") == "GrayStanding" {
            grayButton.backgroundColor = .lightGray
        } else if defaults.string(forKey: "llamaStandingColor") == "BlueStanding" {
            blueButton.backgroundColor = .lightGray
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
                defaults.set(false, forKey: "redColorLocked")
                defaults.set("RedStanding", forKey: "llamaStandingColor")
                defaults.set("RedLeaping", forKey: "llamaLeapingColor")
                highlight(button: redButton)
                for label in [yellowButton, greenButton, blueButton, purpleButton, grayButton] {
                    unHighlight(button: label)
                }
                redButton.setTitle("", for: .normal)
                redButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                redButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                redButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 2 {
                defaults.set(false, forKey: "yellowColorLocked")
                defaults.set("YellowStanding", forKey: "llamaStandingColor")
                defaults.set("YellowLeaping", forKey: "llamaLeapingColor")
                highlight(button: yellowButton)
                for label in [redButton, greenButton, blueButton, purpleButton, grayButton] {
                    unHighlight(button: label)
                }
                yellowButton.setTitle("", for: .normal)
                yellowButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                yellowButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                yellowButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 3 {
                defaults.set(false, forKey: "greenColorLocked")
                defaults.set("GreenStanding", forKey: "llamaStandingColor")
                defaults.set("GreenLeaping", forKey: "llamaLeapingColor")
                highlight(button: greenButton)
                for label in [yellowButton, redButton, blueButton, purpleButton, grayButton] {
                    unHighlight(button: label)
                }
                greenButton.setTitle("", for: .normal)
                greenButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                greenButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                greenButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 5 {
                defaults.set(false, forKey: "purpleColorLocked")
                defaults.set("PurpleStanding", forKey: "llamaStandingColor")
                defaults.set("PurpleLeaping", forKey: "llamaLeapingColor")
                highlight(button: purpleButton)
                for label in [yellowButton, greenButton, blueButton, redButton, grayButton] {
                    unHighlight(button: label)
                }
                purpleButton.setTitle("", for: .normal)
                purpleButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                purpleButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                purpleButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            } else if sender.tag == 6 {
                defaults.set(false, forKey: "grayColorLocked")
                defaults.set("GrayStanding", forKey: "llamaStandingColor")
                defaults.set("GrayLeaping", forKey: "llamaLeapingColor")
                highlight(button: grayButton)
                for label in [yellowButton, greenButton, blueButton, purpleButton, redButton] {
                    unHighlight(button: label)
                }
                grayButton.setTitle("", for: .normal)
                grayButton.imageEdgeInsets = UIEdgeInsets.init(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                grayButton.removeTarget(self, action: #selector(confirmPurchase), for: .touchUpInside)
                grayButton.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
            }
        }
    }
    
    
    
}



