//
//  Novel.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/5.
//

import SwiftUI

struct Novel: Identifiable, Comparable {
    var id: String { book.id }
    var web = String("筆趣閣")
    var class_ = Class()
    var book = Book()
    var chapter = Chapter()
    var rating = Rating()
    var commant = [Commant]()

    static func ==(lhs: Novel, rhs: Novel) -> Bool {
        return lhs.id == rhs.id
    }
    static func <(lhs: Novel, rhs: Novel) -> Bool {
        return lhs.rating.amount < rhs.rating.amount
    }
}

struct Class: Identifiable, Codable, Hashable {
    var id = UUID()
    var order: Int
    var name: String
    var child: [Class]

    init() {
        order = Int()
        name = "首頁"
        child = [Class]()
    }
    
    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        order = try! container.decode(Int.self, forKey: .id)
        name = try! container.decode(String.self, forKey: .name)
        child = try! container.decode([Class].self, forKey: .child)
    }
}

struct Book: Identifiable, Codable {
    var id: String
    var name: String
    var author: String
    var intro: String
    var imageLink: String
    var state: String

    init() {
        id = "\(UUID())"
        name = "小說書名"
        author = "作者"
        intro = "小說簡介"
        imageLink = "封面連結"
        state = "最後更新日期, [連載狀態]"
    }
}

struct Chapter: Codable {
    var count: Int
    var title: [String]
    var link: [String]
    var content: [String]
    var index = Int()
    var keep = [Int]()

    init() {
        count = Int()
        title = [String]()
        link = [String]()
        content = [String]()
    }

    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        count = try! container.decode(Int.self, forKey: .count)
        title = try! container.decode([String].self, forKey: .title)
        link = try! container.decode([String].self, forKey: .link)
        content = Array(repeating: String(), count: count)
    }
}

struct Rating: Codable {
    var amount = Double()
    var number = Int()
}

struct Commant: Codable {
    var rating = Int()
    var content = String("評論內容")
}

struct BookAndRatingAndCommant: Codable {
    var book: Book
    var rating: Rating
    var commant: [Commant]

    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        book = try! container.decode(Book.self, forKey: .book)
        if let rating = try? container.decode(Rating.self, forKey: .rating) {
            self.rating = rating
        }
        else {
            self.rating = Rating()
        }
        if let commant = try? container.decode([Commant].self, forKey: .commant) {
            self.commant = commant
        }
        else {
            self.commant = [Commant]()
        }
    }
}
