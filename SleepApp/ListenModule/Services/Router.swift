//
//  Router.swift
//  SleepApp
//
//  Created by NaYfront on 03.05.2022.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func ListenMainViewController()
    func showDetailViewController(detailContent: [DetailContent])
    func showListenViewController(listenContent: ListenContent)
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.shadowColor = .clear
        appearance.backgroundColor = UIColor(named: "darkBlue")
        appearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0),
                                          .foregroundColor: UIColor.white]

        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func ListenMainViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createListenFirstScreen(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
            navigationController.viewControllers[0].title = "Listen"
        }
    }
    
    func showDetailViewController(detailContent: [DetailContent]) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createListenSecondScreen(detailContent: detailContent, router: self) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    func showListenViewController(listenContent: ListenContent) {
        if let navigationController = navigationController {
            guard let listenViewController = assemblyBuilder?.createListenThirdScreen(listenContent: listenContent, router: self) else { return }
            navigationController.pushViewController(listenViewController, animated: true)
        }
    }
}
