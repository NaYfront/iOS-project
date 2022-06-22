//
//  InfoViewController.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

class InfoViewController: UIViewController, InfoViewProtocol {

    @IBOutlet weak var additionalColectionView: UICollectionView!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    var presenter: InfoViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCollectionView.register(UINib(nibName: "BigCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BigCellCollectionViewCell")
        additionalColectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
    }
    
    @IBAction func buttonAction(_ sender: Any) {
    }
    
}

extension InfoViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainCollectionView {
            return 3
        } else {
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigCellCollectionViewCell", for: indexPath) as? BigCellCollectionViewCell else { return UICollectionViewCell() }
            
            cell.mainView.backgroundColor = presenter.cellContent.bigCellContent[indexPath.item].color
            cell.mainTitleLabel.text = presenter.cellContent.bigCellContent[indexPath.item].mainTitle
            cell.additionalTitleLabel.text = presenter.cellContent.bigCellContent[indexPath.item].additionalTitle
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
            
            cell.mainView.backgroundColor = presenter.cellContent.smallCellContent[indexPath.row].color
            cell.mainTitleLabel.text = presenter.cellContent.smallCellContent[indexPath.row].mainTitle
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == mainCollectionView {
            let listenContent = presenter.cellContent.bigCellContent[indexPath.row].listenContent
            presenter.tapOnTheView(listenContent: listenContent)
        } else {
            let listenContent = presenter.cellContent.smallCellContent[indexPath.row].listenContent
            presenter.tapOnTheView(listenContent: listenContent)
        }
    }
}
