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
    @IBOutlet weak var repeatButton: UIButton!
    
    @IBOutlet weak var firstImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var thirdImageWidthConstraint: NSLayoutConstraint!
    
    var presenter: ListenViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        let url = Bundle.main.path(forResource: self.presenter.content.sound, ofType: "mp3")
        guard let url = url else {
            return
        }
        if let player = SoundManager.shared.player, URL(fileURLWithPath: url) == player.url, player.isPlaying {
            playButton.setTitle("Продолжить", for: .normal)
            SoundManager.shared.player?.pause()
        } else if let player = SoundManager.shared.player, URL(fileURLWithPath: url) != player.url {
            replaySong(self)
        } else {
            playButton.setTitle("Пауза", for: .normal)
            SoundManager.shared.playAudio()
        }
    }
    
    @IBAction func replaySong(_ sender: Any) {
        playButton.setTitle("Пауза", for: .normal)
        SoundManager.shared.replayAudio(sound: self.presenter.content.sound ?? "")
    }
    
    @IBAction func repeatSong(_ sender: Any) {
        guard let player = SoundManager.shared.player else {
            return
        }
        
        if player.numberOfLoops == 0 {
            repeatButton.setImage(UIImage(systemName: "repeat"), for: .normal)
            player.numberOfLoops = -1
        } else {
            repeatButton.imageView?.tintColor = .white
            player.numberOfLoops = 0
        }
    }
    
    private func configure() {
        self.title = presenter.content.title
        authorLabel.text = presenter.content.author
        textLabel.text = presenter.content.text
        
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
