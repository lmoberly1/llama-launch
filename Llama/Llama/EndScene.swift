//
//  EndScene.swift
//  Llama
//
//  Created by Luke Moberly on 5/14/20.
//  Copyright © 2020 Luke Moberly. All rights reserved.
//

import Foundation
import MessageUI
import SpriteKit
import StoreKit
import AVFoundation
import MobileCoreServices


class EndScene: SKScene, MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.view?.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    let defaults = UserDefaults.standard
    
    // BACKGROUND
    var AudioPlayer = AVAudioPlayer()
    let backgroundTexture = SKTexture(imageNamed: "background")
    
    // UI ELEMENTS
    let gameoverLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
    let highscoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 60))
    let scoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
    let highscoreLostLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))

    let restartButton = UIButton(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
    let quitButton = UIButton(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
    let rateButton = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 60))
    let messageButton = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 60))
    
    let coinLabel = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 45))
    let coinText = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 40))
    var coins: Int = 0
    var runCoins: Int = 0
    
    var startValue: Double = 0
    var coinStartValue: Double = Double(UserDefaults.standard.integer(forKey: "coins"))
    let endValue: Double = Double(score)
    let animationDuration: Double = 1.0
    let animationStartDate = Date()
        
    // USER DEFAULTS
    let highScore = UserDefaults.standard.integer(forKey: "highScore")
    
    // MEDALS
    var medalView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    
    override func sceneDidLoad() {
                
        // LOAD LABELS
        gameoverLabel.center = CGPoint(x: frame.size.width/2, y: 0.2 * frame.size.height)
        gameoverLabel.backgroundColor = .clear
        gameoverLabel.text = ("GAME OVER")
        gameoverLabel.font = UIFont(name: "SuperMarioGalaxy", size: 45)
        gameoverLabel.textAlignment = .center
        gameoverLabel.numberOfLines = 0
        gameoverLabel.lineBreakMode = .byWordWrapping
        gameoverLabel.textColor = .black
        
        highscoreLabel.backgroundColor = .clear
        highscoreLabel.text = ("NEW RECORD")
        highscoreLabel.font = UIFont(name: "SuperMarioGalaxy", size: 50)
        highscoreLabel.textAlignment = .center
        highscoreLabel.numberOfLines = 0
        highscoreLabel.lineBreakMode = .byWordWrapping
        highscoreLabel.textColor = .white
        
        scoreLabel.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2 - 65)
        scoreLabel.backgroundColor = .clear
        scoreLabel.text = ("Score: \(score)")
        scoreLabel.font = UIFont(name: "SuperMarioGalaxy", size: 40)
        scoreLabel.textAlignment = .center
        
        highscoreLostLabel.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        highscoreLostLabel.backgroundColor = .clear
        highscoreLostLabel.text = ("High Score: \(highScore)")
        highscoreLostLabel.font = UIFont(name: "SuperMarioGalaxy", size: 40)
        highscoreLostLabel.textAlignment = .center
        highscoreLostLabel.numberOfLines = 0
        highscoreLostLabel.lineBreakMode = .byWordWrapping
        highscoreLostLabel.textColor = .black
        
        restartButton.center = CGPoint(x: frame.size.width/2, y: 0.85 * frame.size.height)
        restartButton.backgroundColor = .clear
        restartButton.setTitle("PLAY AGAIN", for: .normal)
        restartButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 45)
        restartButton.titleLabel?.textAlignment = .center
        restartButton.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
        restartButton.setTitleColor(.black, for: .normal)
        
        quitButton.center = CGPoint(x: frame.size.width/2, y: restartButton.center.y - 65)
        quitButton.backgroundColor = .clear
        quitButton.setTitle("MAIN MENU", for: .normal)
        quitButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 45)
        quitButton.titleLabel?.textAlignment = .center
        quitButton.setTitleColor(.black, for: .normal)
        quitButton.addTarget(self, action: #selector(quit), for: .touchUpInside)
        
        rateButton.center = CGPoint(x: frame.size.width/2, y: (quitButton.center.y - scoreLabel.center.y/1.5))
        rateButton.backgroundColor = .clear
        rateButton.setTitle("Rate Llama Launch!", for: .normal)
        rateButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 25)
        rateButton.titleLabel?.textAlignment = .center
        rateButton.titleLabel?.numberOfLines = 0
        rateButton.titleLabel?.lineBreakMode = .byWordWrapping
        rateButton.setTitleColor(.black, for: .normal)
        rateButton.layer.borderWidth = 2
        rateButton.addTarget(self, action: #selector(rateApp), for: .touchUpInside)
        
        messageButton.center = CGPoint(x: frame.size.width/2, y: (rateButton.center.y + 75))
        messageButton.backgroundColor = .clear
        messageButton.setTitle("Taunt your friends!", for: .normal)
        messageButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 25)
        messageButton.titleLabel?.textAlignment = .center
        messageButton.layer.borderWidth = 2
        messageButton.setTitleColor(.black, for: .normal)
        messageButton.addTarget(self, action: #selector(messageFriend), for: .touchUpInside)
        
        // COINS
//        var tempScore = score
//        while tempScore % 10 != 0 {
//            tempScore -= 1
//        }
        runCoins = (score) // + (2 * tempScore)
        coins += runCoins
        defaults.set(runCoins + defaults.integer(forKey: "coins"), forKey: "coins")
        
        coinLabel.center = CGPoint(x: 30, y: frame.size.height - 30)
        coinLabel.image = UIImage(named: "llamaCoin")
        coinText.textAlignment = .left
        coinText.font = UIFont(name: "SuperMarioGalaxy", size: 30)
        coinText.center = CGPoint(x: coinLabel.center.x + 155, y: frame.size.height - 30)
        
        // COIN ANIMATION
        let displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: RunLoop.Mode.default)
        
        let coinDisplayLink = CADisplayLink(target: self, selector: #selector(coinHandleUpdate))
        coinDisplayLink.add(to: .main, forMode: RunLoop.Mode.default)

        // CREATE BACKGROUND
        createBackground()
        
    }
    
    // COIN ANIMATION
    @objc func coinHandleUpdate() {
        let elapsedTime = Date().timeIntervalSince(animationStartDate)
        let coinEndValue: Double = Double(runCoins) + coinStartValue
        
        if elapsedTime > animationDuration {
            self.coinText.text = "\(Int(coinEndValue))"
        } else {
            let percentage = elapsedTime / animationDuration
            let value = percentage * (coinEndValue - coinStartValue) + coinStartValue
            self.coinText.text = "\(Int(value))"
        }
    }
    
    // SCORE ANIMATION
    @objc func handleUpdate() {
        let elapsedTime = Date().timeIntervalSince(animationStartDate)
        
        if elapsedTime > animationDuration {
            self.scoreLabel.text = "Score: \(Int(endValue))"
        } else {
            let percentage = elapsedTime / animationDuration
            let value = percentage * (endValue - startValue) + startValue
            self.scoreLabel.text = "Score: \(Int(value))"
        }
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
    
    // RATE APP
    @objc func rateApp() {

        if score >= 25 && defaults.bool(forKey: "achievedHighScore25") == false {
            defaults.set(true, forKey: "achievedHighScore25")
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            } else if let url = URL(string: "itms-apps://itunes.apple.com/app/" + "1513837899") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } else if score >= 5 && defaults.bool(forKey: "achievedHighScore5") == false {
            defaults.set(true, forKey: "achievedHighScore5")
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            } else if let url = URL(string: "itms-apps://itunes.apple.com/app/" + "1513837899") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } else {
            guard let writeReviewURL = URL(string: "https://apps.apple.com/us/app/llama-launch/id1516027799?action=write-review")
            else { fatalError("Expected a valid URL") }
            UIApplication.shared.open(writeReviewURL, options: [:], completionHandler: nil)
        }
    }
    
    // MAIN FUNCTION
    override func didMove(to view: SKView) {
        
        // ADD UI ELEMENTS
        self.view?.addSubview(scoreLabel)
        self.view?.addSubview(coinLabel)
        self.view?.addSubview(coinText)
        medalCeremony()

        if newHighScore == true {
            newHighScore = false
            // UIVIEW
            self.view?.addSubview(highscoreLabel)
            scoreLabel.textColor = .white
            // MUSIC
            let recordMusic = NSURL(fileURLWithPath: Bundle.main.path(forResource: "record", ofType: "mp3")!)
            if !(AVAudioSession.sharedInstance().secondaryAudioShouldBeSilencedHint) {
                AudioPlayer = try! AVAudioPlayer(contentsOf: recordMusic as URL)
                AudioPlayer.play()
            }
            // QUIT, RESTART BUTTONS
            self.run(SKAction.wait(forDuration: 1.5), completion: {
                self.view?.addSubview(self.rateButton)
                self.view?.addSubview(self.messageButton)
            })
            self.run(SKAction.wait(forDuration: 3.5), completion: {
                self.view?.addSubview(self.restartButton)
                self.view?.addSubview(self.quitButton)
            })
            
        } else {
            self.view?.addSubview(highscoreLostLabel)
            self.view?.addSubview(gameoverLabel)
            scoreLabel.textColor = .black
            // MUSIC
            let deathMusic = NSURL(fileURLWithPath: Bundle.main.path(forResource: "death", ofType: "mp3")!)
            if !(AVAudioSession.sharedInstance().secondaryAudioShouldBeSilencedHint) {
                AudioPlayer = try! AVAudioPlayer(contentsOf: deathMusic as URL)
                AudioPlayer.play()
            }

            // QUIT, RESTART BUTTONS
            self.view?.addSubview(restartButton)
            self.view?.addSubview(quitButton)
            
        }
    }
    
    // NEW MEDAL
    func medalCeremony() {
        if newHighScore == true && defaults.string(forKey: "medalCeremony") != "LeapingLlama" && score >= 1000 {
            defaults.set("LeapingLlama", forKey: "medalCeremony")
            medalView = UIImageView(image: UIImage(named: "medalLeapingLlama"))
            medalView.contentMode = .scaleAspectFit
            medalView.frame = CGRect(x: frame.size.width/2 - 175,
                                     y: (highscoreLabel.center.y + scoreLabel.center.y)/2 - 10,
                                     width: 85, height: 85)
            highscoreLabel.center = CGPoint(x: frame.size.width/2, y: 0.15 * frame.size.height)
            scoreLabel.center = CGPoint(x: frame.size.width/2 + 50, y: medalView.center.y)
            self.view?.addSubview(medalView)
        } else if newHighScore == true &&
            (defaults.string(forKey: "medalCeremony") != "Llama" || defaults.string(forKey: "medalCeremony") != "LeapingLlama") && score >= 250 {
            defaults.set("Llama", forKey: "medalCeremony")
            medalView = UIImageView(image: UIImage(named: "medalLlama"))
            medalView.contentMode = .scaleAspectFit
            medalView.frame = CGRect(x: frame.size.width/2 - 175,
                                     y: (highscoreLabel.center.y + scoreLabel.center.y)/2 - 10,
                                     width: 85, height: 85)
            highscoreLabel.center = CGPoint(x: frame.size.width/2, y: 0.15 * frame.size.height)
            scoreLabel.center = CGPoint(x: frame.size.width/2 + 50, y: medalView.center.y)
            self.view?.addSubview(medalView)
        } else if newHighScore == true &&
            (defaults.string(forKey: "medalCeremony") == "Silver" || defaults.string(forKey: "medalCeremony") == "Bronze" || defaults.string(forKey: "medalCeremony") == "None") && score >= 100 {
            defaults.set("Gold", forKey: "medalCeremony")
            medalView = UIImageView(image: UIImage(named: "medalGold"))
            medalView.contentMode = .scaleAspectFit
            medalView.frame = CGRect(x: frame.size.width/2 - 175,
                                     y: (highscoreLabel.center.y + scoreLabel.center.y)/2 - 10,
                                     width: 85, height: 85)
            highscoreLabel.center = CGPoint(x: frame.size.width/2, y: 0.15 * frame.size.height)
            scoreLabel.center = CGPoint(x: frame.size.width/2 + 50, y: medalView.center.y)
            self.view?.addSubview(medalView)
        } else if newHighScore == true &&
            (defaults.string(forKey: "medalCeremony") == "Bronze" || defaults.string(forKey: "medalCeremony") == "None") && score >= 25 {
            defaults.set("Silver", forKey: "medalCeremony")
            medalView = UIImageView(image: UIImage(named: "medalSilver"))
            medalView.contentMode = .scaleAspectFit
            medalView.frame = CGRect(x: frame.size.width/2 - 175,
                                     y: (highscoreLabel.center.y + scoreLabel.center.y)/2 - 10,
                                     width: 85, height: 85)
            highscoreLabel.center = CGPoint(x: frame.size.width/2, y: 0.15 * frame.size.height)
            scoreLabel.center = CGPoint(x: frame.size.width/2 + 50, y: medalView.center.y)
            self.view?.addSubview(medalView)
        } else if newHighScore == true && defaults.string(forKey: "medalCeremony") == "None" && score >= 5 {
            defaults.set("Bronze", forKey: "medalCeremony")
            medalView = UIImageView(image: UIImage(named: "medalBronze"))
            medalView.contentMode = .scaleAspectFit
            medalView.frame = CGRect(x: frame.size.width/2 - 175,
                                     y: (highscoreLabel.center.y + scoreLabel.center.y)/2 - 10,
                                     width: 85, height: 85)
            highscoreLabel.center = CGPoint(x: frame.size.width/2, y: 0.15 * frame.size.height)
            scoreLabel.center = CGPoint(x: frame.size.width/2 + 50, y: medalView.center.y)
            self.view?.addSubview(medalView)
        } else if newHighScore == true {
            highscoreLabel.center = CGPoint(x: frame.size.width/2, y: 0.20 * frame.size.height)
            scoreLabel.center = CGPoint(x: frame.size.width/2, y: highscoreLabel.center.y + 50)
        } else {
            highscoreLabel.center = CGPoint(x: frame.size.width/2, y: 0.20 * frame.size.height)
        }
    }
    
    // PLAY AGAIN
    @objc func playAgain() {
        score = 0
        // HIDE LABELS
        for label in [restartButton, quitButton, rateButton, gameoverLabel, highscoreLabel, highscoreLostLabel, scoreLabel, medalView, coinLabel, coinText, messageButton] {
            label.isHidden = !label.isHidden
        }
        // RESTART GAME SCENE
        let reveal = SKTransition.fade(withDuration: 0.25)
        let newScene = GameScene(size: self.size)
        view?.presentScene(newScene, transition: reveal)
    }
    // QUIT
    @objc func quit() {
        score = 0
        // HIDE LABELS
        for label in [restartButton, quitButton, rateButton, gameoverLabel, highscoreLabel, highscoreLostLabel, scoreLabel, medalView, coinLabel, coinText, messageButton] {
            label.isHidden = !label.isHidden
        }
        // RETURN TO START SCENE
        let reveal = SKTransition.fade(withDuration: 0.5)
        let newScene = StartScene(size: self.size)
        view?.presentScene(newScene, transition: reveal)
    }
    
    // MESSAGE FRIEND
    @objc func messageFriend() {

        if MFMessageComposeViewController.canSendText() {
            let controller = MFMessageComposeViewController()
            let image : UIImage = textToImage(drawText: "LLAMA LAUNCH\nHIGH SCORE\n\n\(score)", inImage: UIImage(named: "Background.png")!, atPoint: CGPoint(x: 8, y: 230))
            let dataImage = image.jpegData(compressionQuality: 1)
            
            guard dataImage != nil else {
                return
            }
            
            controller.addAttachmentData(dataImage!, typeIdentifier: kUTTypePNG as String, filename: "Background.png")
            controller.messageComposeDelegate = self
            self.view?.window?.rootViewController?.present(controller, animated: true, completion: nil)
        }
    }
    
    // TAUNT FRIENDS
    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.black
        let textFont = UIFont(name: "SuperMarioGalaxy", size: 75)!
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
            NSAttributedString.Key.paragraphStyle: paragraph,
        ] as [NSAttributedString.Key: Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}
