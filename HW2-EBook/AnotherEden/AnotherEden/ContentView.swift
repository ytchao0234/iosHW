//
//  ContentView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/3.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var player = AVPlayer(url: URL(string: "./BGM/Bgm_main_theme.ogg")!)
    
    var body: some View {
        NavigationView {
            TabView {
                MainView()
                    .tabItem {
                        Label("簡介", systemImage: "doc.richtext.fill")
                    }
                GameView(player: $player)
                    .tabItem {
                        Label("遊戲", systemImage: "gamecontroller.fill")
                    }
                ChillView()
                    .tabItem {
                        Label("休閒", systemImage: "gift.fill")
                    }
            }
            .onAppear {
                player.play()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
