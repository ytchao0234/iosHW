//
//  Novel.swift
//  NovelReader
//
//  Created by FanRende on 2021/12/25.
//

import SwiftUI

struct Novel: Identifiable {
    let id = UUID()
    
    let name = String()
    let author = String()
    let introduction = String()
    let chapterTitles = [String]()
    let chapterLinks = [String]()
    var chapterContents = [String]()

    var score = Double()
    var numberOfScores = Int()
    var commants = [String]()
}
