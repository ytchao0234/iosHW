//
//  NovelIntroView.swift
//  NovelReader
//
//  Created by User06 on 2021/12/26.
//

import SwiftUI
import Kingfisher

struct NovelIntroView: View {
    @ObservedObject var webNovelFetcher: WebNovelFetcher
    let web: String
    let class_: String
    let bookId: Int

    var body: some View {
//        let book = webNovelFetcher.bookList[bookId]
        let book = webNovelFetcher.bookList[0]

        return ZStack {
            Color.green.ignoresSafeArea()
            
            ScrollView(.vertical) {
                HStack {
                    KFImage(URL(string: book.imageLink)!)
                        .resizable()
                        .scaledToFit()
                    VStack(alignment: .leading) {
                        Text(book.book)
                            .font(.title)
                        Text("作者：" + book.author)
                            .padding(.top)
                        Text("章節數：\(book.chapterCount)")
                        Text("連載狀態：待補充")
                    }
                }
                .frame(height: 200)

                Divider()

                Text(book.intro)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                
                Divider()

                Text("評論區")
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NovelIntroView_Previews: PreviewProvider {
    static var previews: some View {
        NovelIntroView(webNovelFetcher: WebNovelFetcher(), web: "筆趣閣", class_: "首頁", bookId: 53)
    }
}
