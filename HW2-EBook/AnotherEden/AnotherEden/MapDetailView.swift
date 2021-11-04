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
    @Binding var player: AVPlayer
    
    var body: some View {
        let playerItem = AVPlayerItem(url: URL(string: map.music)!)
        
        return List {
            Image(map.name)
                .resizable()
                .scaledToFit()
            
            Text(map.intro)
        }
        .onAppear {
            player.replaceCurrentItem(with: playerItem)
            player.play()
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text(map.name)
            }
        })
    }
}

struct MapDetailView_Previews: PreviewProvider {
    @State static var player = AVPlayer(url: URL(string: "./BGM/Bgm_main_theme.ogg")!)
    
    static var previews: some View {
        MapDetailView(map: Map.defaultMap, player: $player)
    }
}
