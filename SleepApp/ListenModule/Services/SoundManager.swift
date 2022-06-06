//
//  SoundManager.swift
//  SleepApp
//
//  Created by NaYfront on 06.06.2022.
//

import Foundation
import UIKit
import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    
    private init() {
        initAudio()
    }
    
    func initAudio() {
        let sound = Bundle.main.path(forResource: "SeaAsmr", ofType: "mp3")
        guard let sound = sound else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
        } catch {
            print("something is wrong")
        }
    }
    
    func playAudio() {
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let player = SoundManager.shared.player else {
                return
            }
            
            player.play()
        } catch {
            print("something went wrong")
        }
    }
    
    func replayAudio(sound: String) {
        let urlString = Bundle.main.path(forResource: sound, ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            
            SoundManager.shared.player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = SoundManager.shared.player else {
                return
            }
            
            player.play()
            
        } catch {
            print("something went wrong")
        }
    }
}
