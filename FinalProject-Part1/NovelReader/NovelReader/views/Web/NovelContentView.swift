//
//  NovelContentView.swift
//  NovelReader
//
//  Created by User06 on 2021/12/26.
//

import SwiftUI

@available(iOS 15.0, *)
struct NovelContentView: View {
    @ObservedObject var webNovelFetcher: WebNovelFetcher
    let web: String
    let class_: Class
    let bookId: UUID

    var body: some View {
        let content = webNovelFetcher.novelList[web]![class_]![bookId]!.chapter.chapterContents[webNovelFetcher.chapterNumber]

        
        return ZStack {
            Color.white.ignoresSafeArea()

            if content != "找不到文章內容（500）" {
                ScrollView(.vertical, showsIndicators: false) {
                    Text(content)
                        .padding()
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .overlay {
                    if let webContent = webNovelFetcher.novelList[web],
                       let classContent = webContent[class_],
                       let novel = classContent[bookId],
                       novel.chapter.chapterContents[webNovelFetcher.chapterNumber].isEmpty {
                        ZStack {
                            Color.white.ignoresSafeArea()
                            ProgressView()
                        }
                    }
                }
            }
            else {
                Text(content)
                    .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

@available(iOS 15.0, *)
struct NovelContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NovelContentView(webNovelFetcher: WebNovelFetcher(), web: "筆趣閣", class_: Class(id: 0, name:"首頁"), bookId: UUID())
        }
    }
}
