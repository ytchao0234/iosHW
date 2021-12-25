//
//  Novel.swift
//  NovelReader
//
//  Created by User08 on 2021/12/25.
//

import SwiftUI

struct Novel: Identifiable {
    let id = UUID()
    
    let bookName = String()
    let author = String()
    let introduction = String()
    let imageLink = String()
    let chapterCount = Int()
    
    let chapterTitles = [String]()
    let chapterLinks = [String]()
    var chapterContents = [String]()
    
    var score = Double()
    var numberOfScore = Int()
}
