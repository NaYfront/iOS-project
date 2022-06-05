//
//  ListenViewController.swift
//  SleepApp
//
//  Created by NaYfront on 27.05.2022.
//

import UIKit
import AVFoundation

class ListenViewController: UIViewController {

    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var firstImage: UIImageView!
    @IBOutlet var secondImage: UIImageView!
    @IBOutlet var thirdImage: UIImageView!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet var playButton: UIButton!
    
    @IBOutlet weak var firstImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var thirdImageWidthConstraint: NSLayoutConstraint!
    
    var presenter: ListenViewPresenterProtocol!
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        if let player = player, player.isPlaying {
            playButton.setTitle("Продолжить", for: .normal)
            player.pause()
        } else {
            playButton.setTitle("Пауза", for: .normal)
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let player = player else {
                    return
                }
                
                player.play()
            } catch {
                print("something went wrong")
            }
        }
    }
    
    @IBAction func replaySong(_ sender: Any) {
        playButton.setTitle("Stop", for: .normal)
        let urlString = Bundle.main.path(forResource: "SeaAsmr", ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = player else {
                return
            }
            
            player.play()
            
        } catch {
            print("something went wrong")
        }
    }
    
    private func initAudioPlayer() {
        let urlString = Bundle.main.path(forResource: "SeaAsmr", ofType: "mp3")!
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            player?.prepareToPlay()
        } catch {
            print("Error getting the audio file")
        }
    }
    
    private func configure() {
        self.title = presenter.content.title
        authorLabel.text = presenter.content.author
        textLabel.text = presenter.content.text
        
        initAudioPlayer()
        
        changeImage(image: presenter.content.images[0], constraint: firstImageWidthConstraint, imageView: firstImage)
        changeImage(image: presenter.content.images[1], constraint: secondImageWidthConstraint, imageView: secondImage)
        changeImage(image: presenter.content.images[2], constraint: thirdImageWidthConstraint, imageView: thirdImage)
    }
}

extension ListenViewController: ListenViewProtocol {
    func changeImage(image: UIImage?, constraint: NSLayoutConstraint!, imageView: UIImageView!) {
        if image == nil {
            constraint.constant = 0
        } else {
            imageView.image = image
        }
    }
}
