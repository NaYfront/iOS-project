//
//  HelperViewController.swift
//  SleepApp
//
//  Created by NaYfront on 04.06.2022.
//

import UIKit

class HelperViewController: UIViewController, InfoViewProtocol {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: InfoViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionCell")
    }
}

extension HelperViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let restVC = RestModuleBuilder.createRestFirstScreen()
        navigationController?.pushViewController(restVC, animated: true)
    }
}
