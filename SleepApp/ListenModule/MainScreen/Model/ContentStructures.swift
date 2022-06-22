//
//  ListenContent.swift
//  SleepApp
//
//  Created by NaYfront on 06.04.2022.
//

import Foundation
import UIKit

struct MainContent {
    let title: String
    let color: UIColor
    let detailContent: [DetailContent]
}

struct DetailContent {
    let author: String
    let title: String
    let image: UIImage
    let listenContent: ListenContent
}

struct ListenContent {
    let author: String
    let title: String
    let images: [UIImage?]
    let sound: String?
    let text: String
}

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
