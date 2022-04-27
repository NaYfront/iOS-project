//
//  ListenViewController.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

class ListenViewController: UIViewController {

    var presenter: ListenViewPresenterProtocol!
    
    @IBOutlet weak var contentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentTableView.register(UINib(nibName: "ContentTableViewCell", bundle: nil), forCellReuseIdentifier: "contentCell")
    }
    
//        @IBAction func buttonAction(_ sender: Any) {
//        guard let button = sender as? UIButton else { return }
//
//        switch button.tag {
//        case 0:
//            print("0")
//        case 1:
//            print("1")
//        case 2:
//            print("2")
//        case 3:
//            print("3")
//        default:
//            return
//        }
//    }
}

extension ListenViewController: ListenViewProtocol {
    func setGreeting(greeting: String) {
        print("setGreeting")
    }
}

// MARK: - Table View Data Source
extension ListenViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        if indexPath.row > 2 {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let postVC = storyboard.instantiateViewController(withIdentifier: "PostViewController") as? PostViewController
//
//            postVC?.post = user.posts[indexPath.row - 3]
//            postVC?.setUser(user: user)
//
//            navigationController?.pushViewController(postVC!, animated: true)
//        }
//    }
}

// MARK: - Table View Delegate
extension ListenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 || indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell", for: indexPath) as? ContentTableViewCell else { return UITableViewCell() }
            
            return cell
        }
        
        return UITableViewCell()
    }
}
