//
//  ContentView.swift
//  NovelReader
//
//  Created by FanRende on 2021/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var webNovelFetcher = WebNovelFetcher()
    var body: some View {
        TabView {
            KeepView()
                .tabItem {Label("收藏", systemImage: "doc")}
            Text("網站")
                .tabItem {Label("網站", systemImage: "doc")}
            Text("本站")
                .tabItem {Label("本站", systemImage: "doc")}
        }
        .onAppear {
            webNovelFetcher.previewChapterList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
