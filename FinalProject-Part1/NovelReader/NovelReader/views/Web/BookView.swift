//
//  BookView.swift
//  NovelReader
//
//  Created by User06 on 2021/12/25.
//

import SwiftUI
import Kingfisher

struct BookView: View {
    @ObservedObject var webNovelFetcher: WebNovelFetcher
    let web: String
    let class_: String

    var body: some View {
        List {
            ForEach(webNovelFetcher.bookList, id: \.self.bookId) { book in
                NavigationLink(
                    destination: NovelView(webNovelFetcher: webNovelFetcher, web: web, class_: class_, bookId: book.bookId),
                    label: {
                        HStack {
                            KFImage(URL(string: book.imageLink)!)
                                .resizable()
                                .scaledToFit()
                            VStack(alignment: .leading) {
                                Text(book.book)
                                    .font(.title2)
                                    .lineLimit(1)
                                Text("作者：" + book.author)
                                    .padding(.top)
                                Text("章節數：\(book.chapterCount)")
                                Text("連載狀態：待補充")
                            }
                        }
                    })
            }
            .frame(height: 100)
            .padding(10)
        }
        .navigationTitle("書目")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if webNovelFetcher.bookList.isEmpty {
                webNovelFetcher.previewBookList()
            }
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookView(webNovelFetcher: WebNovelFetcher(), web: "筆趣閣", class_: "首頁")
        }
    }
}

struct Book: Codable {
    var bookId: Int
    var book: String
    var author: String
    var intro: String
    var imageLink: String
    var chapterCount: Int
}

