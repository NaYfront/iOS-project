//
//  InfoDetailViewController.swift
//  SleepApp
//
//  Created by NaYfront on 05.06.2022.
//

import UIKit

class InfoDetailViewController: UIViewController {

    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var firstImage: UIImageView!
    @IBOutlet var secondImage: UIImageView!
    @IBOutlet var thirdImage: UIImageView!
    @IBOutlet var textLabel: UILabel!
    
    @IBOutlet weak var firstImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var thirdImageWidthConstraint: NSLayoutConstraint!
    
    var presenter: InfoDetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
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

extension InfoDetailViewController: InfoDetailViewProtocol {
    func changeImage(image: UIImage?, constraint: NSLayoutConstraint!, imageView: UIImageView!) {
        if image == nil {
            constraint.constant = 0
        } else {
            imageView.image = image
        }
    }
}
