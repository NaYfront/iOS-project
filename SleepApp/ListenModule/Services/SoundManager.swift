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
    var player: AVAudioPlayer?

    func initAudio() {
        let urlString = Bundle.main.path(forResource: "SeaAsmr", ofType: "mp3")!
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            player?.prepareToPlay()
        } catch {
            print("Error getting the audio file")
        }
    }
}
