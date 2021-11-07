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
    
    var body: some View {
        NavigationView {
            
            TabView {
                
                MainView(player: $player)
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
                if let sound = Bundle.main.url(forResource: "Bgm_main_theme", withExtension: "mp3") {
                    do {
                        self.player?.stop()
                        try self.player = AVAudioPlayer(contentsOf: sound)
                        self.player?.numberOfLoops = .max
                        self.player?.play()
                    }
                    catch {
                        print("error: \(error)")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
