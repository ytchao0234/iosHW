//
//  MapDetailView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI
import AVKit

struct MapDetailView: View {
    var map: Map
    @Binding var player: AVAudioPlayer?
    
    var body: some View {
        return List {
            Image(map.name)
                .resizable()
                .scaledToFit()
            
            Text(map.intro)
        }
        .onAppear {
            print(map.music)
            if let sound = Bundle.main.url(forResource: map.music, withExtension: "mp3") {
                do {
                    player?.stop()
                    try self.player = AVAudioPlayer(contentsOf: sound)
                    self.player?.numberOfLoops = .max
                    self.player?.play()
                }
                catch {
                    print("error: \(error)")
                }
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text(map.name)
            }
        })
    }
}

struct MapDetailView_Previews: PreviewProvider {
    @State static var player: AVAudioPlayer?
    
    static var previews: some View {
        MapDetailView(map: Map.defaultMap, player: $player)
    }
}
