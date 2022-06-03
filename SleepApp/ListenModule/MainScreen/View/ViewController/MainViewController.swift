//
//  ListenViewController.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {
    // MARK: - IBOutlets
    @IBOutlet weak var mainTableView: UITableView!
    
    // MARK: - Properties
    var presenter: MainViewPresenterProtocol!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "mainCell")
    }
}

// MARK: - Table View Data Source
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        cell.mainView.backgroundColor = presenter.content[indexPath.row].color
        cell.viewLabel.text = presenter.content[indexPath.row].title
        
        let animation = TableAnimationFactory.makeConstriction(rowHeight: 26, duration: 0.85, delayFactor: 0.05)
        let animator = TableViewAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
        
        return cell
    }
}

// MARK: - Table View Delegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailContent = presenter.content[indexPath.row].detailContent
        presenter.tapOnTheView(detailContent: detailContent)
        
    }
}
