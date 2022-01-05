//
//  Novel.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/5.
//

import SwiftUI

struct Novel: Identifiable {
    var id: String { book.id }
    var web = String("筆趣閣")
    var class_ = Class()
    var book = Book()
    var chapter = Chapter()
    var rating = Rating()
    var commant = [Commant]()
}

struct Class: Identifiable, Codable, Hashable {
    var id: String = "\(UUID())"
    var name = String("首頁")
    var child = [Class]()
    
    init() {}
    
    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        id = try! container.decode(String.self, forKey: .id)
        name = try! container.decode(String.self, forKey: .name)
        child = try! container.decode([Class].self, forKey: .child)
    }
}

struct Book: Identifiable, Codable {
    var id: String = "\(UUID())"
    var name = String("小說書名")
    var author = String("作者")
    var intro = String("小說簡介")
    var imageLink = String("封面連結")
    var state = String("最後更新日期, [連載狀態]")
    var chapterCount = Int()
    
    init() {}
    
    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        id = try! container.decode(String.self, forKey: .id)
        name = try! container.decode(String.self, forKey: .name)
        author = try! container.decode(String.self, forKey: .author)
        intro = try! container.decode(String.self, forKey: .intro)
        imageLink = try! container.decode(String.self, forKey: .imageLink)
        state = try! container.decode(String.self, forKey: .state)
        chapterCount = try! container.decode(Int.self, forKey: .chapterCount)
    }
}

struct Chapter: Codable {
    var title = [String]()
    var link = [String]()
    var content = [String]()

    init() {}

    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        title = try! container.decode([String].self, forKey: .title)
        link = try! container.decode([String].self, forKey: .link)
        self.content = Array(repeating: String(), count: self.link.count)
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
