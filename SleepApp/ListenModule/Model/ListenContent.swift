//
//  ListenContent.swift
//  SleepApp
//
//  Created by NaYfront on 27.04.2022.
//

import Foundation
import UIKit

struct ModuleContent {
    let title: String
    let color: UIColor
    let content: [ListenContent]
}

struct ListenContent {
    let author: String
    let title: String
    let text: String?
}
