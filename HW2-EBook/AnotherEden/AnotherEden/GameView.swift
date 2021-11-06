//
//  GameView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI
import AVKit

struct GameView: View {
    @Binding var player: AVAudioPlayer?
    
    var body: some View {
        VStack {
            NavigationLink(
                destination: StoryView(),
                label: {
                    Text("劇情")
                        .font(.title)
                        .padding()
                })
            NavigationLink(
                destination: CharacterView(),
                label: {
                    Text("角色")
                        .font(.title)
                        .padding()
                })
            NavigationLink(
                destination: MapView(player: $player),
                label: {
                    Text("地圖")
                        .font(.title)
                        .padding()
                })
            NavigationLink(
                destination: DungeonView(),
                label: {
                    Text("副本")
                        .font(.title)
                        .padding()
                })
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("遊戲")
                    .font(.title)
            }
        })
    }
}

struct GameView_Previews: PreviewProvider {
    @State static var player: AVAudioPlayer?
    
    static var previews: some View {
        GameView(player: $player)
    }
}
