//
//  MusicManager.swift
//  Llama
//
//  Created by Luke Moberly on 5/16/20.
//  Copyright © 2020 Luke Moberly. All rights reserved.
//

import Foundation
import AVFoundation

class MusicManager {
    
    static let shared = MusicManager()
    
    var audioPlayer = AVAudioPlayer()
    
    private init() { }
    
    func setup() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "menu", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        } catch {
            print (error)
        }
    }
    
    func play() {
        audioPlayer.play()
    }
    
    func stop() {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        audioPlayer.prepareToPlay()
    }
    
}
