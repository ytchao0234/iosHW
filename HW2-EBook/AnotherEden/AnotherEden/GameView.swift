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
    @Binding var currentTime: Double
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: StoryView(),
                    label: {
                        Image("story")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(30)
                            .padding(.horizontal)
                    })
                NavigationLink(
                    destination: CharacterView(player: $player, currentTime: $currentTime),
                    label: {
                        Image("character")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(30)
                            .padding(.horizontal)
                    })
                NavigationLink(
                    destination: MapView(player: $player, currentTime: $currentTime),
                    label: {
                        Image("map")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(30)
                            .padding(.horizontal)
                    })
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("遊戲")
                }
            })
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color("launchColor"), Color("bgColor")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
            .ignoresSafeArea()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    @State static var player: AVAudioPlayer?
    @State static var currentTime: Double = 0
    
    static var previews: some View {
        GameView(player: $player, currentTime: $currentTime)
    }
}
