//
//  ListenBuilder.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

protocol MainBuilder {
    static func createListenFirstScreen() -> UINavigationController
    static func createListenSecondScreen(detailContent: [DetailContent]) -> UIViewController
    static func createModuleContent() -> [MainContent]
}

class MainModuleBuilder: MainBuilder {
    static func createListenFirstScreen() -> UINavigationController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view, content: createModuleContent())
        view.presenter = presenter
        
        view.tabBarItem = UITabBarItem(title: "Listen", image: UIImage(systemName: "headphones"), tag: 0)
        view.title = "Listen"
        
        let nav = UINavigationController(rootViewController: view)
        
        return nav
    }
    
    static func createListenSecondScreen(detailContent: [DetailContent]) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, detailContent: detailContent)
        view.presenter = presenter

        return view
    }
    
    static func createModuleContent() -> [MainContent] {
        let asmrDetailContent =
        [DetailContent(author: "Petr Petrov", title: "Relaxing Sounds", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage()),
         DetailContent(author: "Artem Artemov", title: "Very Relaxing Sounds", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage()),
         DetailContent(author: "Igor Igorev", title: "Ultra Relaxing Sounds", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage())]
        
        let fairytalesDetailContent =
        [DetailContent(author: "John Ronald Reuel Tolkien", title: "The Lord of the Rings", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage()),
         DetailContent(author: "Jane Austen", title: "Pride and Prejudice", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage()),
         DetailContent(author: "Philip Nicholas Outram Pullman", title: "His Dark Materials", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage())]
        
        let literatureDetailContent =
        [DetailContent(author: "Petr Petrov", title: "Relaxing Sounds", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage()),
         DetailContent(author: "Artem Artemov", title: "Very Relaxing Sounds", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage()),
         DetailContent(author: "Igor Igorev", title: "Ultra Relaxing Sounds", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage())]
        
        return [MainContent(title: "ASMR", color: UIColor(named: "iceGreen") ?? .white, detailContent: asmrDetailContent),
                MainContent(title: "Fairy Tales", color: UIColor(named: "deepBlue") ?? .white, detailContent: fairytalesDetailContent),
                MainContent(title: "Literature", color: UIColor(named: "deepPurple") ?? .white, detailContent: literatureDetailContent),
                MainContent(title: "Something", color: .yellow, detailContent: asmrDetailContent)]
    }
}
