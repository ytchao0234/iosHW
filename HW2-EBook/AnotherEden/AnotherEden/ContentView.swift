//
//  ContentView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/3.
//

import SwiftUI
import AVKit

let BGM: AVPlayerItem = AVPlayerItem(url: Bundle.main.url(forResource: "Bgm_main_theme", withExtension: "mp3")!)

struct ContentView: View {
    @State var player = AVQueuePlayer()
    @State var looper: AVPlayerLooper?
    
    var body: some View {
        TabView {
            MainView(player: $player)
                .tabItem {
                    Label("主頁", systemImage: "house.fill")
                }
//            GameView(player: $player)
//                .tabItem {
//                    Label("遊戲", systemImage: "gamecontroller.fill")
//                }
            ChillView()
                .tabItem {
                    Label("休閒", systemImage: "gift.fill")
                }
        }
        .onAppear {
            if self.looper == nil {
                self.looper = AVPlayerLooper(player: self.player, templateItem: BGM)
                self.player.play()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
    }
}
