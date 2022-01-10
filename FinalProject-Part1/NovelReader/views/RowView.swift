//
//  RowView.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/5.
//

import SwiftUI

struct RowView: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    let element: Any

    var body: some View {
        if let element = element as? String {
            WebRow(web: element)
        }
        else if let element = element as? Class {
            ClassRow(class_: element)
        }
        else if let element = element as? Book {
            BookRow(book: element)
        }
    }
}

struct WebRow: View {
    let web: String

    var body: some View {
        Text(web)
    }
}

struct ClassRow: View {
    let class_: Class

    var body: some View {
        Text("\(class_.name)")
    }
}

struct BookRow: View {
    let book: Book
    
    var body: some View {
        Text("\(book.name)")
    }
}
