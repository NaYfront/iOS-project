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
        
        let listen = ListenContent(author: "authorProverka", title: "titleProverka", images: [UIImage(systemName: "questionmark.app.fill") ?? UIImage(), UIImage(systemName: "questionmark.app.fill") ?? UIImage(), UIImage(systemName: "questionmark.app.fill") ?? UIImage()], sound: nil, text: "textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka textProverka")
        
        let asmr1 = ListenContent(author: "Расслабляющие звуки моря", title: "Звуки моря", images: [UIImage(named: "asmrSea1") ?? UIImage(), UIImage(named: "asmrSea2") ?? UIImage(), UIImage(named: "asmrSea3") ?? UIImage()], sound: "SeaAsmr", text: """
        Перед тем как уснуть, окажитесь на просторном пляже, почуствуйте песок под ногами и слушайте как волнится море
        """)
        
        let asmr2 = ListenContent(author: "Голос лес", title: "Природа", images: [UIImage(named: "forest1") ?? UIImage(), UIImage(named: "forest2") ?? UIImage(), UIImage(named: "forest3") ?? UIImage()], sound: "forestSound", text: """
        Идеальная возможность отдохнуть телом и душой, вдыхая свежий целебный воздух и слушая звуки природы.
        """)
        
        let asmr3 = ListenContent(author: "Гроза", title: "Под крышей дома", images: [UIImage(named: "groza1") ?? UIImage(), UIImage(named: "groza2") ?? UIImage(), nil], sound: "groza", text: """
        Звуки затянувшегося дождя, порывы дождя, временами раскаты
        """)
        
        let fairy1 = ListenContent(author: "Джонатан Свифт", title: "Гулливер в стране лилипутов", images: [UIImage(named: "gulliver1") ?? UIImage(), UIImage(named: "gulliver2") ?? UIImage(), nil], sound: "gulliver", text: """
        Захватывающая история о приключениях отважного моряка Лемюэля Гулливера в удивительной стране Лилипутии. Красочные, подробные иллюстрации Андрея Симанчука помогут в деталях увидеть всю историю пребывания Человека-Горы среди маленьких человечков.
        """)
        
        let fairy2 = ListenContent(author: "Антуан де Сент-Экзюпери", title: "Маленький принц", images: [UIImage(named: "prince1") ?? UIImage(), UIImage(named: "prince2") ?? UIImage(), UIImage(named: "prince3") ?? UIImage()], sound: "prince", text: """
        «Ма́ленький принц» — аллегорическая повесть-сказка, наиболее известное произведение Антуана де Сент-Экзюпери. Сказка рассказывает о Маленьком принце, который посещает различные планеты в космосе, включая Землю. Книга обращается к темам одиночества, дружбы, любви и утраты.
        """)
        
        let fairy3 = ListenContent(author: "Льюис Кэрролл", title: "Алиса в стране чудес", images: [UIImage(named: "alice1") ?? UIImage(), nil, nil], sound: "alice", text: """
        Жизнь 19-летней Алисы Кингсли принимает неожиданный оборот. На викторианской вечеринке, устроенной в её честь, Алисе делает предложение Хэмиш, богатый, но глупый сын лорда и леди Эскот. Не дав ответа, девушка убегает и идёт за кроликом, замеченным ею на лужайке. Кролик как кролик, вот только он одет в камзол и всё время смотрит на карманные часы.
        """)
        
        let music1 = ListenContent(author: "Музыкальные инструменты", title: "Пианино", images: [UIImage(named: "piano1") ?? UIImage(), UIImage(named: "piano2") ?? UIImage(), UIImage(named: "piano3") ?? UIImage()], sound: "music1", text: """
        
        """)
        
        let music2 = ListenContent(author: "Музыкальные инструменты", title: "Арфа и флейта", images: [UIImage(named: "arpha1") ?? UIImage(), UIImage(named: "arpha2") ?? UIImage(), nil], sound: "music2", text: """
        """)
        
        let music3 = ListenContent(author: "Музыкальные инструменты", title: "Ксилофон", images: [UIImage(named: "ks1") ?? UIImage(), nil, nil], sound: "music3", text: """
        """)
        
        let music4 = ListenContent(author: "Музыкальные инструменты", title: "Фортепиано", images: [UIImage(named: "fort1") ?? UIImage(), nil, nil], sound: "music4", text: """
        """)

        let asmrDetailContent =
        [
         DetailContent(author: asmr1.author, title: asmr1.title, image: UIImage(named: "asmrSea") ?? UIImage(), listenContent: asmr1),
         DetailContent(author: asmr2.author, title: asmr2.title, image: UIImage(named: "forest") ?? UIImage(), listenContent: asmr2),
         DetailContent(author: asmr3.author, title: asmr3.title, image: UIImage(named: "groza") ?? UIImage(), listenContent: asmr3)
        ]
        
        let fairytalesDetailContent =
        [
         DetailContent(author: fairy1.author, title: fairy1.title, image: UIImage(named: "fairy1") ?? UIImage(), listenContent: fairy1),
         DetailContent(author: fairy2.author, title: fairy2.title, image: UIImage(named: "fairy2") ?? UIImage(), listenContent: fairy2),
         DetailContent(author: fairy3.author, title: fairy3.title, image: UIImage(named: "fairy3") ?? UIImage(), listenContent: fairy3)
        ]
        
        let musicContent =
        [
         DetailContent(author: music1.author, title: music1.title, image: UIImage(named: "music1") ?? UIImage(), listenContent: music1),
         DetailContent(author: music2.author, title: music2.title, image: UIImage(named: "music2") ?? UIImage(), listenContent: music2),
         DetailContent(author: music3.author, title: music3.title, image: UIImage(named: "music3") ?? UIImage(), listenContent: music3),
         DetailContent(author: music4.author, title: music4.title, image: UIImage(named: "music4") ?? UIImage(), listenContent: music4)
        ]
        
        return
        [
            MainContent(title: "ASMR", color: UIColor(named: "iceGreen") ?? .white, detailContent: asmrDetailContent),
            MainContent(title: "Fairy Tales", color: UIColor(named: "deepBlue") ?? .white, detailContent: fairytalesDetailContent),
            MainContent(title: "Music", color: UIColor(named: "deepPurple") ?? .white, detailContent: musicContent)
        ]
    }
}
