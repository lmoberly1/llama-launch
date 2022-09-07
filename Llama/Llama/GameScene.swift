//
//  GameScene.swift
//  Llama
//
//  Created by Luke Moberly on 5/12/20.
//  Copyright © 2020 Luke Moberly. All rights reserved.
//

import SpriteKit
import GameplayKit
import GoogleMobileAds
import AVFoundation

// GLOBAL SCORE VARIABLE
var score = 0
var newHighScore = false

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let ignoresSiblingOrder = true
    var audioPlayer : AVAudioPlayer?
    
    // UI ELEMENTS
    let scoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
    var instructionsImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

    let gameoverLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
    let restartButton = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
    let quitButton = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
    var canGameover = true
    var canDeletePlatforms = true
    
    // SKNodes
    let initialPlatforms = SKNode()
    let balloon = SKSpriteNode()
    let ground = SKSpriteNode()
    
    let mountain = SKSpriteNode()
    let mountains = SKNode()
    
    var player = SKSpriteNode()
    let players = SKNode()
    
    // GLOBAL TEXTURES
    let background = SKSpriteNode()
    let initialGroundTexture = SKTexture(imageNamed: "spawningGround1")
    
    let playerTexture = SKTexture(imageNamed: UserDefaults.standard.string(forKey: "llamaStandingColor")!)
    let playerTexture2 = SKTexture(imageNamed: UserDefaults.standard.string(forKey: "llamaLeapingColor")!)
    let hatTexture = SKTexture(imageNamed: UserDefaults.standard.string(forKey: "hatColor")!)
    let sweaterTexture = SKTexture(imageNamed: UserDefaults.standard.string(forKey: "sweaterColor")!)
    let scarfTexture = SKTexture(imageNamed: UserDefaults.standard.string(forKey: "scarfColor")!)
    
    let backgroundTexture = SKTexture(imageNamed: "background")
    let mountainTextures = SKTexture(imageNamed: "mountainDirt1.5")
    
    // VECTOR VARIABLES
    var canJump = Bool()
    var canScore = Bool()
    let playerVel = 70.0 // 70.0
    let bigPlayerVel = 108.0 // 105.0
    let mountainTimeBase = 0.70
    let mountainTimeRange = 0.15 // seconds
    let minBound = 0.40
    let gravity = 7.0 // 6.0; maybe 7.5 or 8?
    var lastHeight: CGFloat = 0.0
    
    // PHYSICS CATEGORIES
    let playerCategory: UInt32 = 1 << 0
    let mountainCategory: UInt32 = 1 << 1
    let scoreCategory: UInt32 = 1 << 2
    let platformCategory: UInt32 = 1 << 3
    

    // INITIALIZE SCENE
    override func sceneDidLoad() {
        // CREATE BACKGROUND
        createBackground()
        BannerAd.removeFromSuperview()
        
        // CREATE LABELS
        scoreLabel.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2 - frame.size.height/3)
        scoreLabel.textAlignment = .center
        scoreLabel.text = "\(score)"
        scoreLabel.font = UIFont(name: "SuperMarioGalaxy", size: 45)

        // SPAWN INITIAL PLATFORMS AND PLAYER
        createInitialPlatforms()
        createPlayer()
        
        // INSTRUCTIONS LABEL
        let instructionsImage = UIImage(named: "gestures")
        instructionsImageView = UIImageView(image: instructionsImage)
        instructionsImageView.contentMode = .scaleAspectFit
        instructionsImageView.frame = CGRect(x: frame.size.width/2 - 50, y: frame.size.height/2 - 100, width: 100, height: 100)
        
        // MUSIC
        MusicManager.shared.stop()
    }
        
    // MAIN FUNCTION
    override func didMove(to view: SKView) {
        // ADD LABELS
        self.view?.addSubview(scoreLabel)
        
        // ADD SKNodes
        addChild(initialPlatforms)
        addChild(mountains)
        
        // ADD PHYSICS
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -gravity)
        self.physicsWorld.contactDelegate = self
        physicsWorld.speed = 0.9999
        canJump = true
        canScore = true
        
        // ADD GESTURE RECOGNIZERS
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(bigJump(sender:)))
        upSwipe.direction = .up
        view.addGestureRecognizer(upSwipe)
        let touch = UITapGestureRecognizer(target: self, action: #selector(smallJump(sender:)))
        self.view?.addGestureRecognizer(touch)
        
        // INSTRUCTIONS
        self.view?.addSubview(instructionsImageView)
        let delay = SKAction.wait(forDuration: 3)
        self.run(delay, completion: {
            self.instructionsImageView.isHidden = true
        })

        
    }
    
    // BIG JUMP
    @objc private func bigJump(sender: UISwipeGestureRecognizer) {
        if canJump == true {
            canJump = false
            player.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: (bigPlayerVel)))
            // CHANGE PLAYER TEXTURE
            let textureChangeToLeap = SKAction.setTexture(playerTexture2, resize: true)
            let delay = SKAction.wait(forDuration: TimeInterval(0.5))
            let textureChangeToStand = SKAction.setTexture(playerTexture, resize: true)
            player.run(SKAction.sequence([textureChangeToLeap, delay, textureChangeToStand]))
                        
        }
    }
    // SMALL JUMP
    @objc private func smallJump(sender: UITapGestureRecognizer) {
        if canJump == true {
            canJump = false
            player.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: playerVel))
            // CHANGE PLAYER TEXTURE
            let textureChangeToLeap = SKAction.setTexture(playerTexture2, resize: true)
            let delay = SKAction.wait(forDuration: TimeInterval(0.5))
            let textureChangeToStand = SKAction.setTexture(playerTexture, resize: true)
            player.run(SKAction.sequence([textureChangeToLeap, delay, textureChangeToStand]))
        }
    }
    

    // LOAD AND MOVE BACKGROUND
    func createBackground() {
        for i in 0 ... 3 {
            // SPAWN BACKGROUND
            let background = SKSpriteNode(texture: backgroundTexture)
            background.zPosition = -10
            background.anchorPoint = CGPoint.zero
            background.position = CGPoint(x: (backgroundTexture.size().width * CGFloat(i) - CGFloat(1 * i)), y: 0)
            background.size.height = frame.size.height
            addChild(background)
            
            // MOVE BACKGROUND
            let distanceToMove = frame.size.width
            let moveLeft = SKAction.moveBy(x: -backgroundTexture.size().width, y: 0, duration: TimeInterval(distanceToMove/20))
            let moveReset = SKAction.moveBy(x: backgroundTexture.size().width, y: 0, duration: 0)
            let moveLoop = SKAction.sequence([moveLeft, moveReset])
            background.run(SKAction.repeatForever(moveLoop))
        }
    }
    
    
    // CREATE PLATFORMS
    private func createInitialPlatforms() {
        // SPAWN BALLOON
        let balloon = SKSpriteNode(imageNamed: "spawningBalloon")
        balloon.position = CGPoint(x: 0, y: frame.size.height + 100)
        balloon.zPosition = 5
        balloon.setScale(2.0)
        initialPlatforms.addChild(balloon)
    
        // SPAWN GROUND
        let ground = SKSpriteNode(imageNamed: "spawningGround")
        lastHeight = 0.45 * frame.size.height
        ground.position = CGPoint(x: -750,
                                  y: 0.45*frame.size.height - 0.5*ground.size.height)
        ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.categoryBitMask = platformCategory
        initialPlatforms.addChild(ground)
        initialPlatforms.position = CGPoint(x: 1.5 * frame.size.width, y: 0)
        
        
        // MOVE
        let distanceToMove = frame.size.width + 2 * ground.size.width
        let moveLeft = SKAction.moveBy(x: -distanceToMove,
                                       y: 0,
                                       duration: TimeInterval(distanceToMove/400)) // 350
        let deletePlatforms = SKAction.removeFromParent()
        let platformSequence = SKAction.sequence([moveLeft, deletePlatforms])
        initialPlatforms.run(platformSequence)
    }
    
    
    // CREATE PLAYER
    private func createPlayer() {
        // SPAWN PLAYER
        player = SKSpriteNode(texture: playerTexture)
        players.addChild(player)
        player.xScale *= -1
        player.zPosition = 0
        players.position = CGPoint(x: balloon.position.x - player.size.width - 13,
                                  y: frame.size.height + 100 - 2.35 * player.size.height)
        
        // PLAYER HAT
        let hat = SKSpriteNode(texture: hatTexture)
        player.addChild(hat)
        hat.zPosition = 1
        hat.setScale(0.80)
        hat.position = CGPoint(x: -10, y: 60)
        
        // PLAYER SWEATER
        let sweater = SKSpriteNode(texture: sweaterTexture)
        player.addChild(sweater)
        sweater.zPosition = 1
        sweater.xScale = 1.20
        sweater.yScale = 1.10
        sweater.position = CGPoint(x: 4, y: 3)
        
        let scarf = SKSpriteNode(texture: scarfTexture)
        player.addChild(scarf)
        scarf.zPosition = 2
        scarf.xScale = -0.30
        scarf.yScale = 0.35
        scarf.position = CGPoint(x: 8, y: -10)
        
        // PLAYER PHYSICS
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.isDynamic = false
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.categoryBitMask = playerCategory
        player.physicsBody?.collisionBitMask = mountainCategory | platformCategory
        player.physicsBody?.contactTestBitMask = scoreCategory | platformCategory
        
        // INITIAL MOVEMENT
        initialPlatforms.addChild(players)
        let delay = SKAction.wait(forDuration: TimeInterval(frame.size.width/(285 + 50))) // smaller = further left
        let removeFromNode = SKAction.removeFromParent()
        let playerSequence = SKAction.sequence([delay, removeFromNode])
        players.run(playerSequence, completion: {
            self.players.position = CGPoint(x: self.initialPlatforms.position.x + self.players.position.x,
                                            y: self.initialPlatforms.position.y + self.players.position.y)
            self.players.move(toParent: self)
            self.player.physicsBody?.isDynamic = true
        })
    }
    
    
    // SPAWNS MOUNTAINS
    private func spawnMountains() {
        let spawn = SKAction.run(createMountain)
        let delay = SKAction.wait(forDuration: TimeInterval(mountainTimeBase), withRange: mountainTimeRange)
        self.run(SKAction.repeatForever(SKAction.sequence([spawn, delay])))
    }

    
    // CREATE MOUNTAIN
    private func createMountain() {
        
        let mountain = SKSpriteNode(imageNamed: "mountainDirt1.5")
        
        // MOUNTAIN NODE
//        let groundHeight = CGFloat.random(in: (CGFloat(minBound) * frame.size.height) ...
//            (CGFloat(minBound) * frame.size.height + 80))
        var groundHeight = CGFloat.random(in: (lastHeight - 70) ... (lastHeight + 70))

        if groundHeight < 100 {
            groundHeight = 100 + 80
        } else if groundHeight > frame.size.height - 1.25 * player.size.height {
            groundHeight = frame.size.height - 1.25 * player.size.height
        }
                
        mountain.position = CGPoint(x: frame.size.width + 0.5 * SKTexture(imageNamed: "mountainDirt1.5").size().width, y: groundHeight - 0.5 * mountain.size.height)
        mountain.physicsBody = SKPhysicsBody(rectangleOf: mountain.size)
        mountain.physicsBody?.isDynamic = false
        mountain.physicsBody?.categoryBitMask = mountainCategory
        
        lastHeight = groundHeight

        // CONTACT NODE
        let contactZone = SKNode()
        contactZone.position = CGPoint(x: 0,
                                       y: 0.5*mountain.size.height)
        contactZone.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0.85 * SKTexture(imageNamed: "mountainDirt1.5").size().width, height: 10))
        contactZone.physicsBody?.isDynamic = false
        contactZone.physicsBody?.categoryBitMask = scoreCategory
        mountain.addChild(contactZone)
        
        // MOVE MOUNTAIN
        let distanceToMove = frame.size.width * 2.5
        let moveMountain = SKAction.moveBy(x: -distanceToMove, y: 0.0, duration: TimeInterval(distanceToMove/400))
        let removeMountain = SKAction.removeFromParent()
        let moveRemoveMountain = SKAction.sequence([moveMountain, removeMountain])
        
        // MOVE MOUNTAIN NODE
        mountains.addChild(mountain)
        mountains.zPosition = 0
        mountain.run(moveRemoveMountain)
    }
    
    
    // CONTACT TEST
    func didBegin(_ contact: SKPhysicsContact) {
        // ORDER PHYSICS BODIES
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        // CHECK FOR PLAYER AND CONTACT COLLISION
        if firstBody.categoryBitMask == playerCategory && secondBody.categoryBitMask == scoreCategory {
            canJump = true
            if canScore == true {
                scoreUpdate()
            }
        } else if firstBody.categoryBitMask == playerCategory && secondBody.categoryBitMask == platformCategory {
            canJump = true
        }
    }
    
    private func scoreUpdate() {
        canScore = false
        score += 1
        UIView.transition(with: scoreLabel,
            duration: 0.25,
            options: .transitionCrossDissolve,
            animations: {},
            completion: nil)
        scoreLabel.text = String(score)
        self.run(SKAction.wait(forDuration: 0.25), completion: {
            self.canScore = true
        })
    }
    
    // UPDATE
    override func update(_ currentTime: TimeInterval) {
        let positionInScene = players.convert(player.position, to: self)
        let groundPositionInScene = initialPlatforms.convert(ground.position, to: self)
        
        // CHECK FOR PLAYER DEATH
        if (positionInScene.y < 0 || positionInScene.x < 0) && canGameover == true {
            gameOver()
            canGameover = false
        }
        
        // SPAWN MOUNTAINS
        if (groundPositionInScene.x + 0.5 * initialGroundTexture.size().width) < frame.size.width - 100
            && canDeletePlatforms == true {
            spawnMountains()
            canDeletePlatforms = false
        }
    }
    
    // GAME OVER
    private func gameOver() {

        // ADS
        self.view?.addSubview(BannerAd)
        
        // HIDE EXISTING ELEMENTS
        scoreLabel.isHidden = true
        mountains.removeAllChildren()
        players.removeAllChildren()
    
        // CHECK HIGH SCORE
        var highScore = UserDefaults.standard.integer(forKey: "highScore")
        if score > highScore {
            highScore = score
            UserDefaults.standard.set(highScore, forKey: "highScore")
            newHighScore = true
        }

        
        // CALL ENDSCENE
        let newScene = EndScene(size: self.size)
        view?.presentScene(newScene)
        
    }
        
    
}
    
    
    
