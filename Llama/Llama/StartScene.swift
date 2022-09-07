//
//  StartScene.swift
//  Llama
//
//  Created by Luke Moberly on 5/12/20.
//  Copyright © 2020 Luke Moberly. All rights reserved.
//

import SpriteKit
import UIKit
import Foundation
import AVFoundation

class StartScene: SKScene {

    // UI LABELS
    let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 120))
    let highScoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 120))
    
    // UI MEDALS
    var medalView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    var medalView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    var medalView3 = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    var medalView4 = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    var medalView5 = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))

    
    // UI BUTTONS
    let musicButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    var musicImage = UIImage()
    let playButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 75))
    let customizeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 400, height: 50))

    // USER DEFAULTS
    let defaults = UserDefaults.standard
    var player: AVAudioPlayer?
    
    // SCENE INITIALIZATION
    override func sceneDidLoad() {
        
        // TITLE LABEL
        titleLabel.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2 - frame.size.height/3)
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.preferredMaxLayoutWidth = frame.size.width - 100
        titleLabel.numberOfLines = 2
        titleLabel.text = "Llama"
        titleLabel.font = UIFont(name: "SuperMarioGalaxy", size: 70)
        
        // HIGH SCORE LABEL
        let highScore = defaults.integer(forKey: "highScore")
        highScoreLabel.center = CGPoint(x: frame.size.width/2, y: titleLabel.center.y + 150)
        highScoreLabel.textAlignment = .center
        highScoreLabel.lineBreakMode = .byWordWrapping
        highScoreLabel.numberOfLines = 2
        highScoreLabel.text = "High Score:\n\(highScore)"
        highScoreLabel.font = UIFont(name: "SuperMarioGalaxy", size: 50)
        
        // MEDAL LABELS
        medalView = UIImageView(image: UIImage(named: "medal5"))
        medalView.contentMode = .scaleAspectFit
        medalView.frame = CGRect(x: frame.size.width/2 - 170, // half of width,
                                 y: highScoreLabel.center.y + 50, width: 60, height: 60)
        
        medalView2 = UIImageView(image: UIImage(named: "medalGray"))
        medalView2.contentMode = .scaleAspectFit
        medalView2.frame = CGRect(x: frame.size.width/2 - 100, // half of width,
                                  y: highScoreLabel.center.y + 50, width: 60, height: 60)

        medalView3 = UIImageView(image: UIImage(named: "medalGray"))
        medalView3.contentMode = .scaleAspectFit
        medalView3.frame = CGRect(x: frame.size.width/2 - 30, // half of width,
                                  y: highScoreLabel.center.y + 50, width: 60, height: 60)
        
        medalView4 = UIImageView(image: UIImage(named: "medalGray"))
        medalView4.contentMode = .scaleAspectFit
        medalView4.frame = CGRect(x: frame.size.width/2 + 40, // half of width,
                                  y: highScoreLabel.center.y + 50, width: 60, height: 60)
        
        medalView5 = UIImageView(image: UIImage(named: "medalGray"))
        medalView5.contentMode = .scaleAspectFit
        medalView5.frame = CGRect(x: frame.size.width/2 + 110, // half of width,
                                  y: highScoreLabel.center.y + 50, width: 60, height: 60)
        
        if highScore >= 5 {
            medalView = UIImageView(image: UIImage(named: "medalBronze"))
            medalView.contentMode = .scaleAspectFit
            medalView.frame = CGRect(x: frame.size.width/2 - 170, // half of width,
                                      y: highScoreLabel.center.y + 50, width: 60, height: 60)
            
            medalView2 = UIImageView(image: UIImage(named: "medal25"))
            medalView2.contentMode = .scaleAspectFit
            medalView2.frame = CGRect(x: frame.size.width/2 - 100, // half of width,
                                        y: highScoreLabel.center.y + 50, width: 60, height: 60)
        }
        if highScore >= 25 {
            medalView2 = UIImageView(image: UIImage(named: "medalSilver"))
            medalView2.contentMode = .scaleAspectFit
            medalView2.frame = CGRect(x: frame.size.width/2 - 100, // half of width,
                                           y: highScoreLabel.center.y + 50, width: 60, height: 60)
            
            medalView3 = UIImageView(image: UIImage(named: "medal100"))
            medalView3.contentMode = .scaleAspectFit
            medalView3.frame = CGRect(x: frame.size.width/2 - 30, // half of width,
                                       y: highScoreLabel.center.y + 50, width: 60, height: 60)
        }
        if highScore >= 100 {
            medalView3 = UIImageView(image: UIImage(named: "medalGold"))
            medalView3.contentMode = .scaleAspectFit
            medalView3.frame = CGRect(x: frame.size.width/2 - 30, // half of width,
                                         y: highScoreLabel.center.y + 50, width: 60, height: 60)
            medalView4 = UIImageView(image: UIImage(named: "medal250"))
            medalView4.contentMode = .scaleAspectFit
            medalView4.frame = CGRect(x: frame.size.width/2 + 40, // half of width,
                                       y: highScoreLabel.center.y + 50, width: 60, height: 60)
        }
        if highScore >= 250 {
            medalView4 = UIImageView(image: UIImage(named: "medalLlama"))
            medalView4.contentMode = .scaleAspectFit
            medalView4.frame = CGRect(x: frame.size.width/2 + 40, // half of width,
                                        y: highScoreLabel.center.y + 50, width: 60, height: 60)
            
            medalView5 = UIImageView(image: UIImage(named: "medal1000"))
            medalView5.contentMode = .scaleAspectFit
            medalView5.frame = CGRect(x: frame.size.width/2 + 110, // half of width,
                                        y: highScoreLabel.center.y + 50, width: 60, height: 60)
        }
        if highScore >= 1000 {
            medalView5 = UIImageView(image: UIImage(named: "medalLeapingLlama"))
            medalView5.contentMode = .scaleAspectFit
            medalView5.frame = CGRect(x: frame.size.width/2 + 110, // half of width,
                                        y: highScoreLabel.center.y + 50, width: 60, height: 60)
        }

        // PLAY BUTTON
        playButton.center = CGPoint(x: frame.size.width/2, y: 0.90 * frame.size.height)
        playButton.backgroundColor = .clear
        playButton.setTitle("PLAY", for: .normal)
        playButton.setTitleColor(.black, for: .normal)
        playButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 45)
        playButton.titleLabel?.textAlignment = .center
        
        // CUSTOMIZE BUTTON
        customizeButton.center = CGPoint(x: frame.size.width/2, y: playButton.center.y - 65)
        customizeButton.backgroundColor = .clear
        customizeButton.setTitle("CUSTOMIZE", for: .normal)
        customizeButton.setTitleColor(.black, for: .normal)
        customizeButton.titleLabel?.font = UIFont(name: "SuperMarioGalaxy", size: 40)
        customizeButton.titleLabel?.textAlignment = .center

        // MUSIC BUTTON
        musicButton.center = CGPoint(x: frame.size.width - 50, y: frame.size.height - 50)
        musicButton.setBackgroundImage(musicImage, for: .normal)
         
    }
    

    // MAIN FUNCTION
    override func didMove(to view: SKView) {
        
        // ADD BACKGROUND
        createBackground()
        
        // ADD LABELS
        self.view?.addSubview(titleLabel)
        self.view?.addSubview(highScoreLabel)
        self.view?.addSubview(musicButton)
        self.view?.addSubview(medalView)
        self.view?.addSubview(medalView2)
        self.view?.addSubview(medalView3)
        self.view?.addSubview(medalView4)
        self.view?.addSubview(medalView5)
        self.view?.addSubview(playButton)
        self.view?.addSubview(customizeButton)
        musicButton.addTarget(self, action: #selector(musicState), for: .touchUpInside)
        playButton.addTarget(self, action: #selector(playGame), for: .touchUpInside)
        customizeButton.addTarget(self, action: #selector(customizeLlama), for: .touchUpInside)
        

    }

    // CREATE BACKGROUND
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
                
        // CHECK MUSIC STATE
        if defaults.bool(forKey: "music") == false {
            MusicManager.shared.stop()
            musicImage = UIImage(named: "musicOff")!
            musicButton.setBackgroundImage(musicImage, for: .normal)
        } else if !AVAudioSession.sharedInstance().secondaryAudioShouldBeSilencedHint {
            MusicManager.shared.play()
            musicImage = UIImage(named: "musicPlay")!
            musicButton.setBackgroundImage(musicImage, for: .normal)
        } else {
            musicImage = UIImage(named: "musicPlay")!
            musicButton.setBackgroundImage(musicImage, for: .normal)
        }
    }
    
    // PLAY OR PAUSE MUSIC
    @objc func musicState(sender: UIButton!) {
        if defaults.bool(forKey: "music") == true {
            defaults.set(false, forKey: "music")
            MusicManager.shared.stop()
            musicImage = UIImage(named: "musicOff")!
            musicButton.setBackgroundImage(musicImage, for: .normal)
            
        } else {
            MusicManager.shared.play()
            defaults.set(true, forKey: "music")
            musicImage = UIImage(named: "musicPlay")!
            musicButton.setBackgroundImage(musicImage, for: .normal)
        }
    }
    
    // PLAY GAME
    @objc func playGame(sender: UIButton!) {
//        // CLICK SOUND
//        guard let url = Bundle.main.url(forResource: "click", withExtension: "mp3") else {return}
//        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//
//            guard let player = player else {return}
//            player.play()
//        } catch let error {
//            print(error.localizedDescription)
//        }
        
        // HIDE EXISTING LABELS
        for label in [titleLabel, highScoreLabel, playButton, musicButton, medalView, medalView2, medalView3, medalView4, medalView5, customizeButton] {
            label.isHidden = !label.isHidden
        }
        // TRANSITION TO GAME SCENE
        let reveal = SKTransition.fade(withDuration: TimeInterval(0.5))
        let newScene = GameScene(size: self.size)
        view!.presentScene(newScene, transition: reveal)
    }
    
    // CUSTOMIZE
    @objc func customizeLlama(sender: UIButton) {
        // HIDE EXISTING LABELS
        for label in [titleLabel, highScoreLabel, playButton, musicButton, medalView, medalView2, medalView3, medalView4, medalView5, customizeButton] {
            label.isHidden = !label.isHidden
        }
        // TRANSITION TO CUSTOMIZE SCENE
        let newScene = CustomizeScene(size: self.size)
        view!.presentScene(newScene)
    }
    
    
}

