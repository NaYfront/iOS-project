//
//  InfoRouter.swift
//  SleepApp
//
//  Created by NaYfront on 05.06.2022.
//

import UIKit

protocol RouterInfo {
    var navigationController: UINavigationController? { get set }
    var infoBuilder: InfoBuilderProtocol? { get set }
}

protocol InfoRouterProtocol: RouterInfo {
    func InfoMainViewController()
    func showInfoSecondScreen(listenContent: ListenContent)
}

class InfoRouter: InfoRouterProtocol {
    var navigationController: UINavigationController?
    var infoBuilder: InfoBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: InfoBuilderProtocol) {
        
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
        self.infoBuilder = assemblyBuilder
    }
    
    func InfoMainViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = infoBuilder?.createInfoFirstScreen(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
            navigationController.viewControllers[0].title = "Info"
        }
    }
    
    func showInfoSecondScreen(listenContent: ListenContent) {
        if let navigationController = navigationController {
            guard let listenViewController = infoBuilder?.createInfoSecondScreen(listenContent: listenContent, router: self) else { return }
            navigationController.pushViewController(listenViewController, animated: true)
        }
    }
}
