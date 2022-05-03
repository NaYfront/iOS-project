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
    func initialViewController()
    func showDetailViewController(detailContent: [DetailContent])
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createListenFirstScreen(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showDetailViewController(detailContent: [DetailContent]) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createListenSecondScreen(detailContent: detailContent, router: self) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
