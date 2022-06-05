//
//  InfoStructures.swift
//  SleepApp
//
//  Created by NaYfront on 05.06.2022.
//

import Foundation
import UIKit

struct CellContent {
    let bigCellContent: [BigCellContent]
    let smallCellContent: [SmallCellContent]
}

struct BigCellContent {
    let mainTitle: String
    let additionalTitle: String?
    let color: UIColor
    let listenContent: ListenContent
}

struct SmallCellContent {
    let mainTitle: String
    let color: UIColor
    let listenContent: ListenContent
}
