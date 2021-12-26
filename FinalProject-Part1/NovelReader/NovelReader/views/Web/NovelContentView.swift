//
//  NovelContentView.swift
//  NovelReader
//
//  Created by User06 on 2021/12/26.
//

import SwiftUI

struct NovelContentView: View {
    @ObservedObject var webNovelFetcher: WebNovelFetcher

    var body: some View {
        ZStack(alignment: .leading) {
            Color.white.ignoresSafeArea()

//            Text(webNovelFetcher.contentList[webNovelFetcher.chapterNumber])
//                .padding()
            Text("NovelContent")
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NovelContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NovelContentView(webNovelFetcher: WebNovelFetcher())
        }
    }
}
