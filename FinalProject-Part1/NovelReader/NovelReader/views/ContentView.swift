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
    @State var selection = 1
    var body: some View {
        TabView(selection: $selection) {
            KeepView()
                .tabItem {Label("收藏", systemImage: "bookmark.fill")}
                .tag(0)
            WebView(webNovelFetcher: webNovelFetcher)
                .tabItem {Label("網站", systemImage: "network")}
                .tag(1)
            Text("本站")
                .tabItem {Label("本站", systemImage: "server.rack")}
                .tag(2)
        }
        .background(Color.white)
        .preferredColorScheme(.light)
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
