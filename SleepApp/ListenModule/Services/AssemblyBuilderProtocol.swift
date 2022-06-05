//
//  ListenBuilder.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createListenFirstScreen(router: RouterProtocol) -> UIViewController
    func createListenSecondScreen(detailContent: [DetailContent], router: RouterProtocol) -> UIViewController
    func createListenThirdScreen(listenContent: ListenContent, router: RouterProtocol) -> UIViewController
    func createModuleContent() -> [MainContent]
}

class MainModuleAssemblyBuilder: AssemblyBuilderProtocol {
    func createListenFirstScreen(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view, content: createModuleContent(), router: router)
        view.presenter = presenter
        
        view.tabBarItem = UITabBarItem(title: "Listen", image: UIImage(systemName: "headphones"), tag: 0)
        view.title = "Listen"
        
        return view
    }
    
    func createListenSecondScreen(detailContent: [DetailContent], router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, router: router, detailContent: detailContent)
        view.presenter = presenter

        return view
    }
    
    func createListenThirdScreen(listenContent: ListenContent, router: RouterProtocol) -> UIViewController {
        let view = ListenViewController()
        let presenter = ListenPresenter(view: view, content: listenContent, router: router)
        view.presenter = presenter

        return view
    }
    
    func createModuleContent() -> [MainContent] {
        
        let listen = ListenContent(author: "authorProverka", title: "titleProverka", images: [UIImage(systemName: "questionmark.app.fill") ?? UIImage(), UIImage(systemName: "questionmark.app.fill") ?? UIImage(), UIImage(systemName: "questionmark.app.fill") ?? UIImage()], text: "textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka")
        
        let asmrDetailContent =
        [DetailContent(author: "АСМР море", title: "Расслабляющие звуки моря", image: UIImage(named: "asmr1") ?? UIImage(), listenContent: asmr1),
         DetailContent(author: "Музыкальные инструменты", title: "Музыка, помогающая уснуть", image: UIImage(named: "asmr2") ?? UIImage(), listenContent: listen),
         DetailContent(author: "Анастасия", title: "Звуки рук", image: UIImage(named: "asmr3") ?? UIImage(), listenContent: listen)]
        
        let fairytalesDetailContent =
        [DetailContent(author: "John Ronald Reuel Tolkien", title: "The Lord of the Rings", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage(), listenContent: listen),
         DetailContent(author: "Jane Austen", title: "Pride and Prejudice", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage(), listenContent: listen),
         DetailContent(author: "Philip Nicholas Outram Pullman", title: "His Dark Materials", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage(), listenContent: listen)]
        
        let literatureDetailContent =
        [DetailContent(author: "Petr Petrov", title: "Relaxing Sounds", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage(), listenContent: listen),
         DetailContent(author: "Artem Artemov", title: "Very Relaxing Sounds", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage(), listenContent: listen),
         DetailContent(author: "Igor Igorev", title: "Ultra Relaxing Sounds", image: UIImage(systemName: "questionmark.app.fill") ?? UIImage(), listenContent: listen)]
        
        return [MainContent(title: "ASMR", color: UIColor(named: "iceGreen") ?? .white, detailContent: asmrDetailContent),
                MainContent(title: "Fairy Tales", color: UIColor(named: "deepBlue") ?? .white, detailContent: fairytalesDetailContent),
                MainContent(title: "Literature", color: UIColor(named: "deepPurple") ?? .white, detailContent: literatureDetailContent),
                MainContent(title: "Something", color: .systemPink, detailContent: asmrDetailContent)]
    }
}

let asmr1 = ListenContent(author: "Расслабляющие звуки моря", title: "Звуки моря", images: [UIImage(named: "asmrSea1") ?? UIImage(), UIImage(named: "asmrSea2") ?? UIImage(), UIImage(named: "asmrSea3") ?? UIImage()], text: """
Перед тем как уснуть, окажитесь на просторном пляже, почуствуйте песок под ногами и слушайте как волнится море
""")
