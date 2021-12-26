//
//  ContentView.swift
//  NovelReader
//
//  Created by FanRende on 2021/12/25.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
    @StateObject var webNovelFetcher = WebNovelFetcher()
    var body: some View {
        TabView {
            KeepView()
                .tabItem {Label("收藏", systemImage: "bookmark.fill")}
            WebView(webNovelFetcher: webNovelFetcher)
                .tabItem {Label("網站", systemImage: "network")}
            Text("本站")
                .tabItem {Label("本站", systemImage: "server.rack")}
        }
        .onAppear {
            webNovelFetcher.previewChapterList()
        }
        .preferredColorScheme(.light)
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
