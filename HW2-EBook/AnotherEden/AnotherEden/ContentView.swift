//
//  ContentView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/3.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var player: AVAudioPlayer?
    @State var currentTime: Double = 0
    
    var body: some View {
        TabView {
            MainView(player: $player)
                .tabItem {
                    Label("主頁", systemImage: "house.fill")
                }
            GameView(player: $player, currentTime: $currentTime)
                .tabItem {
                    Label("遊戲", systemImage: "gamecontroller.fill")
                }
            ChillView()
                .tabItem {
                    Label("休閒", systemImage: "gift.fill")
                }
        }
        .onAppear {
            if let sound = Bundle.main.url(forResource: "Bgm_main_theme", withExtension: "mp3") {
                do {
                    self.player?.stop()
                    self.player?.currentTime = self.currentTime
                    try self.player = AVAudioPlayer(contentsOf: sound)
                    self.player?.numberOfLoops = .max
                    self.player?.volume = 0.2
                    self.player?.play()
                }
                catch {
                    print("error: \(error)")
                }
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
