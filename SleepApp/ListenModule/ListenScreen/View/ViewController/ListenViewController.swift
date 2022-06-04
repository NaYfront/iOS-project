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
    
    @IBOutlet weak var firstImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var thirdImageWidthConstraint: NSLayoutConstraint!
    
    var presenter: ListenViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func configure() {
        self.title = presenter.content.title
        authorLabel.text = presenter.content.author
        textLabel.text = presenter.content.text
        
        changeImage(image: presenter.content.images[0], constraint: firstImageWidthConstraint, imageView: firstImage)
        changeImage(image: presenter.content.images[1], constraint: secondImageWidthConstraint, imageView: secondImage)
        changeImage(image: presenter.content.images[2], constraint: thirdImageWidthConstraint, imageView: thirdImage)
    }
    
    private func changeImage(image: UIImage?, constraint: NSLayoutConstraint!, imageView: UIImageView!) {
        if image == nil {
            constraint.constant = 0
        } else {
            imageView.image = image
        }
    }
}
