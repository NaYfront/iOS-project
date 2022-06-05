//
//  InfoBuilder.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

protocol InfoBuilderProtocol {
    func createInfoFirstScreen(router: InfoRouterProtocol) -> UIViewController
    func createInfoSecondScreen(listenContent: ListenContent, router: InfoRouterProtocol) -> UIViewController
    func createInfoModuleContent() -> CellContent
}

class InfoModuleBuilder: InfoBuilderProtocol {
    func createInfoFirstScreen(router: InfoRouterProtocol) -> UIViewController {
        let view = InfoViewController()
        let presenter = InfoPresenter(view: view, router: router, cellContent: createInfoModuleContent())
        view.presenter = presenter
        
        view.tabBarItem = UITabBarItem(title: "Rest", image: UIImage(systemName: "book.fill"), tag: 0)
        view.title = "Discover"
        
        return view
    }
    
    func createInfoSecondScreen(listenContent: ListenContent, router: InfoRouterProtocol) -> UIViewController {
        let view = InfoDetailViewController()
        let presenter = InfoDetailPresenter(view: view, content: listenContent, router: router)
        view.presenter = presenter

        return view
    }
    
    func createInfoModuleContent() -> CellContent {
        let listen = ListenContent(author: "authorProverka", title: "titleProverka", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage(), images: [UIImage(systemName: "questionmark.app.fill") ?? UIImage(), UIImage(systemName: "questionmark.app.fill") ?? UIImage(), UIImage(systemName: "questionmark.app.fill") ?? UIImage()], text: "textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka")
        
        let bigCellContent = [
            BigCellContent(mainTitle: "The Importance of Sleep", additionalTitle: "5 facts about the importance of sleep for health", color: UIColor(named: "deepBlue-1") ?? .white, listenContent: listen),
            BigCellContent(mainTitle: "The Importance of Sleep", additionalTitle: "5 facts about the importance of sleep for health", color: UIColor(named: "deepBlue") ?? .white, listenContent: listen),
            BigCellContent(mainTitle: "The Importance of Sleep", additionalTitle: "5 facts about the importance of sleep for health", color: UIColor(named: "deepBlue") ?? .white, listenContent: listen)
                        ]
        let smallCellContent = [
            SmallCellContent(mainTitle: "Sleep phases", color: UIColor(named: "deepGreen") ?? .white, listenContent: listen),
            SmallCellContent(mainTitle: "Sleep modes", color: UIColor(named: "deepPink") ?? .white, listenContent: listen),
            SmallCellContent(mainTitle: "For Children", color: UIColor(named: "deepYellow") ?? .white, listenContent: listen),
            SmallCellContent(mainTitle: "Tips for Sleeping", color: UIColor(named: "deepBlue") ?? .white, listenContent: listen),
            SmallCellContent(mainTitle: "Some Information", color: UIColor(named: "deepRed") ?? .white, listenContent: listen)
                               ]
        let cellContent = CellContent(bigCellContent: bigCellContent, smallCellContent: smallCellContent)
        
        return cellContent
    }
}
