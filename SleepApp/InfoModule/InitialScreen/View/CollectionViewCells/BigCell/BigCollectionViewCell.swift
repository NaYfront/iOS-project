//
//  BigCollectionViewCell.swift
//  SleepApp
//
//  Created by NaYfront on 04.06.2022.
//

import UIKit

class BigCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "BigCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "bigcell")
    }
}

extension BigCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bigcell", for: indexPath) as? BigCellCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let restVC = RestModuleBuilder.createRestFirstScreen()
//
//        // нужно сделать делегат
//        super.navigationController?.pushViewController(restVC, animated: true)
//    }
}
