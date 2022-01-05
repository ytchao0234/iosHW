//
//  ContentView.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/5.
//

import SwiftUI

struct ContentView: View {
    @StateObject var webNovelFetcher = WebNovelFetcher()
    var body: some View {
        VStack {
            Button("Test1"){
                webNovelFetcher.getBookList(web: "筆趣閣", class_: webNovelFetcher.classList["筆趣閣"]![0])
            }
            Button("Test2"){
                webNovelFetcher.getChapterList(class_: webNovelFetcher.classList["筆趣閣"]![0], novel: webNovelFetcher.novelList[webNovelFetcher.classList["筆趣閣"]![0]]![0])
            }
            .padding(.top)
            Button("Test3"){
                webNovelFetcher.getChapterContent(web: "筆趣閣", class_: webNovelFetcher.classList["筆趣閣"]![0], novel: webNovelFetcher.novelList[webNovelFetcher.classList["筆趣閣"]![0]]![0], chapterIndex: 0, chapterLink: webNovelFetcher.novelList[webNovelFetcher.classList["筆趣閣"]![0]]![0].chapter.link[0])
            }
            .padding(.top)
        }
        .onAppear {
            webNovelFetcher.getClassList(web: "筆趣閣")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
