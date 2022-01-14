//
//  ContentView.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/5.
//

import SwiftUI

struct ContentView: View {
    @StateObject var webNovelFetcher = WebNovelFetcher()
    @StateObject var backgroundViewModel = BackgroundViewModel()
    @State private var selection = 1

    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }

    var body: some View {
        TabView(selection: $selection) {
            Text("收藏")
                .tabItem {Label("收藏", systemImage: "bookmark.fill")}
                .tag(0)
            WebListsView()
                .environmentObject(webNovelFetcher)
                .tabItem {Label("網站", systemImage: "network")}
                .tag(1)
            Text("本站")
                .tabItem {Label("本站", systemImage: "server.rack")}
                .tag(2)
        }
        .environmentObject(backgroundViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
