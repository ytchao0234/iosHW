//
//  NovelContentView.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/13.
//

import SwiftUI

struct NovelContentView: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    let novel: Novel
    let index: Int
    let width: Double

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text(webNovelFetcher.flattenNovelList[novel.id]!.chapter.content[index])
                .padding()
                .frame(width: width, alignment: .topLeading)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .overlay {
            if let novel = webNovelFetcher.flattenNovelList[novel.id],
               novel.chapter.content[index].isEmpty {
                ProgressView()
            }
        }
        .onAppear {
            if var novel = webNovelFetcher.flattenNovelList[novel.id],
               novel.chapter.content[index].isEmpty {
                novel.chapter.index = index
                webNovelFetcher.getChapterContent(novel: novel)
            }
        }
    }
}
