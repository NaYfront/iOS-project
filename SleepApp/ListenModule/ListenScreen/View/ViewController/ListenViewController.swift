//
//  ListenViewController.swift
//  SleepApp
//
//  Created by NaYfront on 27.05.2022.
//

import UIKit

class ListenViewController: UIViewController, ListenViewProtocol {

    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var firstImage: UIImageView!
    @IBOutlet var secondImage: UIImageView!
    @IBOutlet var thirdImage: UIImageView!
    @IBOutlet var textLabel: UILabel!
    
    var presenter: ListenViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        authorLabel.text = presenter.content.author
        textLabel.text = presenter.content.text
        firstImage.image = presenter.content.images[0]
        secondImage.image = presenter.content.images[1]
        thirdImage.image = presenter.content.images[2]
        self.title = presenter.content.title
    }
}
