//
//  ListenBuilder.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

protocol ListenBuilder {
    static func createListenFirstScreen() -> UINavigationController
    static func createModuleContent() -> [ModuleContent]
}

class ListenModuleBuilder: ListenBuilder {
    static func createListenFirstScreen() -> UINavigationController {
        let view = ListenViewController()
        let presenter = ListenPresenter(view: view, content: createModuleContent())
        view.presenter = presenter
        
        view.tabBarItem = UITabBarItem(title: "Listen", image: UIImage(systemName: "headphones"), tag: 0)
        view.title = "Listen"
        
        return UINavigationController(rootViewController: view)
    }
    
    static func createModuleContent() -> [ModuleContent] {
        let listenContent =
        [ListenContent(author: "Petr Petrov", title: "Relaxing Sounds", text: nil),
         ListenContent(author: "Artem Artemov", title: "Very Relaxing Sounds", text: nil)]
        
        return [ModuleContent(title: "ASMR", color: UIColor(named: "iceGreen") ?? .white, content: listenContent),
                ModuleContent(title: "ASMR", color: UIColor(named: "iceGreen") ?? .white, content: listenContent)]
    }
}
