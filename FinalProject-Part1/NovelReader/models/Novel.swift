//
//  Novel.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/5.
//

import SwiftUI

struct Novel: Identifiable, Comparable, Codable {
    var id: String { book.id }
    var readTime: Date? = nil
    var keep = Bool()
    var web = String()
    var class_ = Class()
    var book = Book()
    var chapter = Chapter()
    var rating = Rating()
    var commants = [Commant]()
    var commant = Commant()
    
    init(readTime: Date? = nil, keep: Bool = Bool(), web: String = String(), class_: Class = Class(), book: Book = Book(), chapter: Chapter = Chapter(), rating: Rating = Rating(), commants: [Commant] = [Commant](), commant: Commant = Commant()) {
        self.readTime = readTime
        self.keep = keep
        self.web = web
        self.class_ = class_
        self.book = book
        self.chapter = chapter
        self.rating = rating
        self.commants = commants
        self.commant = commant
    }
    
    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        readTime = try? container.decode(Date.self, forKey: .readTime)
        web = try! container.decode(String.self, forKey: .web)
        class_ = try! container.decode(Class.self, forKey: .class_)
        book = try! container.decode(Book.self, forKey: .book)
        chapter = try! container.decode(Chapter.self, forKey: .chapter)
        rating = try! container.decode(Rating.self, forKey: .rating)
        commants = try! container.decode([Commant].self, forKey: .commants)
        commant = try! container.decode(Commant.self, forKey: .commant)
    }

    static func ==(lhs: Novel, rhs: Novel) -> Bool {
        return lhs.id == rhs.id
    }
    static func <(lhs: Novel, rhs: Novel) -> Bool {
        if abs(lhs.rating.amount - rhs.rating.amount) < 0.01 {
            return lhs.book.state > rhs.book.state
        }
        else {
            return lhs.rating.amount > rhs.rating.amount
        }
    }
}

struct Class: Identifiable, Codable, Hashable {
    var id = UUID()
    var order: Int
    var name: String
    var child: [Class]

    init() {
        order = Int()
        name = ""
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
    
    init(id: String = "\(UUID())", name: String = "小說書名", author: String = "作者", intro: String = "小說簡介", imageLink: String = "封面連結", state: String = "最後更新日期, [連載狀態]") {
        self.id = id
        self.name = name
        self.author = author
        self.intro = intro
        self.imageLink = imageLink
        self.state = state
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

extension Rating {
    static var maximum = Double(5)
}

struct Commant: Identifiable, Codable {
    var id: String = "\(UUID())"
    var rating = Int()
    var content = String()

    init() {}

    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        
        if let decId = try? container.decode(String.self, forKey: .id) {
            self.id = decId
        }
        else {
            self.id = "\(UUID())"
        }
        if let decRating = try? container.decode(Int.self, forKey: .rating) {
            self.rating = decRating
        }
        else {
            self.rating = Int()
        }
        if let decContent = try? container.decode(String.self, forKey: .content) {
            self.content = decContent
        }
        else {
            self.content = String()
        }
    }
}

struct Web_Class_Book_Rating_Commant: Codable {
    var web: String
    var class_: Class
    var book: Book
    var rating: Rating
    var commant: [Commant]

    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        web = try! container.decode(String.self, forKey: .web)
        class_ = try! container.decode(Class.self, forKey: .class_)
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
