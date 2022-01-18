//
//  ContentView.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/5.
//

import SwiftUI

struct ContentView: View {
    @StateObject var keepViewModel = KeepViewModel()
    @StateObject var webNovelFetcher = WebNovelFetcher()
    @StateObject var backgroundViewModel = BackgroundViewModel()
    @State private var selection = 0

    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }

    var body: some View {
        TabView(selection: $selection) {
            KeepView()
                .tabItem {Label("收藏", systemImage: "bookmark.fill")}
                .tag(0)
            WebListsView()
                .tabItem {Label("網站", systemImage: "network")}
                .tag(1)
            FindBookView()
                .tabItem {Label("找書", systemImage: "books.vertical")}
                .tag(2)
        }
        .environmentObject(keepViewModel)
        .environmentObject(webNovelFetcher)
        .environmentObject(backgroundViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
