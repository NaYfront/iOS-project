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
        return [MainContent(title: "ASMR", color: UIColor(named: "iceGreen") ?? .white, detailContent: asmrDetailContent),
                MainContent(title: "Fairy Tales", color: UIColor(named: "deepBlue") ?? .white, detailContent: fairytalesDetailContent),
                MainContent(title: "Music", color: UIColor(named: "deepPurple") ?? .white, detailContent: musicContent)]
    }
}

private let asmr1 = ListenContent(author: "Relaxing Sounds of Sea", title: "Sounds of sea", images: [UIImage(named: "asmrSea1") ?? UIImage(), UIImage(named: "asmrSea2") ?? UIImage(), UIImage(named: "asmrSea3") ?? UIImage()], sound: "SeaAsmr", text: """
Before falling asleep, find yourself on a spacious beach, feel the sand under your feet and listen to the waves of the sea
""")

private let asmr2 = ListenContent(author: "The voice of the forest", title: "Nature", images: [UIImage(named: "forest1") ?? UIImage(), UIImage(named: "forest2") ?? UIImage(), UIImage(named: "forest3") ?? UIImage()], sound: "forestSound", text: """
An ideal opportunity to relax your body and soul, inhaling the fresh healing air and listening to the sounds of nature.
""")

private let asmr3 = ListenContent(author: "Thunderstorm", title: "Under the roof of the house", images: [UIImage(named: "groza1") ?? UIImage(), UIImage(named: "groza2") ?? UIImage(), nil], sound: "groza", text: """
Sounds of lingering rain, gusts of rain, peals at times
""")

private let fairy1 = ListenContent(author: "Jonathan Swift", title: "Gulliver's Travels", images: [UIImage(named: "gulliver1") ?? UIImage(), UIImage(named: "gulliver2") ?? UIImage(), nil], sound: "gulliver", text: """
An exciting story about the adventures of the brave sailor Lemuel Gulliver in the amazing land of Lilliput. Colorful, detailed illustrations by Andrey Simanchuk will help you see in detail the whole history of the Mountain Man's stay among the little men.
""")

private let fairy2 = ListenContent(author: "Antoine de Saint-Exupery", title: "The Little Prince", images: [UIImage(named: "prince1") ?? UIImage(), UIImage(named: "prince2") ?? UIImage(), UIImage(named: "prince3") ?? UIImage()], sound: "prince", text: """
The Little Prince is an allegorical fairy tale, the most famous work of Antoine de Saint-Exupery. The tale tells of the Little Prince who visits various planets in space, including Earth. The book addresses themes of loneliness, friendship, love and loss.
""")

private let fairy3 = ListenContent(author: "Lewis Carroll", title: "Alice's Adventures in Wonderland)", images: [UIImage(named: "alice1") ?? UIImage(), nil, nil], sound: "alice", text: """
The life of 19-year-old Alice Kingsley takes an unexpected turn. At a Victorian party held in her honor, Alice is proposed to by Hamish, the wealthy but foolish son of Lord and Lady Ascot. Without giving an answer, the girl runs away and follows the rabbit she saw on the lawn. The rabbit is like a rabbit, only he is dressed in a doublet and looks at his pocket watch all the time.
""")

private let music1 = ListenContent(author: "Musical instruments", title: "Piano", images: [UIImage(named: "piano1") ?? UIImage(), UIImage(named: "piano2") ?? UIImage(), UIImage(named: "piano3") ?? UIImage()], sound: "music1", text: """

""")

private let music2 = ListenContent(author: "Musical instruments", title: "Harp and Flute", images: [UIImage(named: "arpha1") ?? UIImage(), UIImage(named: "arpha2") ?? UIImage(), nil], sound: "music2", text: """
""")

private let music3 = ListenContent(author: "Musical instruments", title: "Xylophone", images: [UIImage(named: "ks1") ?? UIImage(), nil, nil], sound: "music3", text: """
""")

private let music4 = ListenContent(author: "Musical instruments", title: "Piano", images: [UIImage(named: "fort1") ?? UIImage(), nil, nil], sound: "music4", text: """
""")

private let asmrDetailContent =
[
 DetailContent(author: asmr1.author, title: asmr1.title, image: UIImage(named: "asmrSea") ?? UIImage(), listenContent: asmr1),
 DetailContent(author: asmr2.author, title: asmr2.title, image: UIImage(named: "forest") ?? UIImage(), listenContent: asmr2),
 DetailContent(author: asmr3.author, title: asmr3.title, image: UIImage(named: "groza") ?? UIImage(), listenContent: asmr3)
]

private let fairytalesDetailContent =
[
 DetailContent(author: fairy1.author, title: fairy1.title, image: UIImage(named: "fairy1") ?? UIImage(), listenContent: fairy1),
 DetailContent(author: fairy2.author, title: fairy2.title, image: UIImage(named: "fairy2") ?? UIImage(), listenContent: fairy2),
 DetailContent(author: fairy3.author, title: fairy3.title, image: UIImage(named: "fairy3") ?? UIImage(), listenContent: fairy3)
]

private let musicContent =
[
 DetailContent(author: music1.author, title: music1.title, image: UIImage(named: "music1") ?? UIImage(), listenContent: music1),
 DetailContent(author: music2.author, title: music2.title, image: UIImage(named: "music2") ?? UIImage(), listenContent: music2),
 DetailContent(author: music3.author, title: music3.title, image: UIImage(named: "music3") ?? UIImage(), listenContent: music3),
 DetailContent(author: music4.author, title: music4.title, image: UIImage(named: "music4") ?? UIImage(), listenContent: music4)
]
