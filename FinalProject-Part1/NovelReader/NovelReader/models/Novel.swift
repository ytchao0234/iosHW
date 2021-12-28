//
//  Novel.swift
//  NovelReader
//
//  Created by User08 on 2021/12/25.
//

import SwiftUI

struct Novel: Identifiable {
    var id: UUID { UUID(uuidString: book.bookId)! }
    
    var book = Book()
    var chapter = Chapter()
    var commants = [[String]]()
    var commant = ["0", ""]

    init(book: Book) {
        self.book = book
    }
    
    static func >(lhs: Novel, rhs: Novel) -> Bool {
        return lhs.book.rating[0] > rhs.book.rating[0]
    }
}

struct Class: Hashable {
    var id = Int()
    var name = String()
    
    static func <(lhs: Class, rhs: Class) -> Bool {
        return lhs.id < rhs.id
    }
}

struct Book: Codable {
    var bookId = "\(UUID())"
    var book = String()
    var author = String()
    var intro = String()
    var imageLink: String? = String()
    var state = String()
    var chapterCount = Int()
    var rating = [Double]()
}

struct Chapter: Codable {
    var chapterTitles = [String]()
    var chapterLinks = [String]()
    var chapterContents = [String]()
    
    init(chapterList: [[String]] = [[String]]()) {
        self.chapterTitles = chapterList.map({ $0[0] })
        self.chapterLinks = chapterList.map({ $0[1] })
        self.chapterContents = Array(repeating: String(), count: chapterList.count)
    }
}
