//
//  DetailViewController.swift
//  SleepApp
//
//  Created by NaYfront on 06.04.2022.
//

import UIKit

class DetailViewController: UIViewController, DetailViewProtocol {

    @IBOutlet var detailTableView: UITableView!
    
    var presenter: DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "detailCell")
    }
}

// MARK: - Table View Data Source
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.detailContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        
        cell.authorImage.image = presenter.detailContent[indexPath.row].image
        cell.titleLabel.text = presenter.detailContent[indexPath.row].title
        cell.authorLabel.text = presenter.detailContent[indexPath.row].author
        
        return cell
    }
}
