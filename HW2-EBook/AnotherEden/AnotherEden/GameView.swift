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
                Section(header:
                    Text("劇情")
                        .padding(.vertical, 3)
                        .frame(minWidth:0, maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(10)
                ) {
                    NavigationLink(
                        destination: StoryView(),
                        label: {
                            Image("story")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(30)
                        })
                }
                Section(header:
                    Text("角色")
                        .padding(.vertical, 3)
                        .frame(minWidth:0, maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(10)
                ) {
                    NavigationLink(
                        destination: CharacterView(player: $player, currentTime: $currentTime),
                        label: {
                            Image("character")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(30)
                        })
                }
                Section(header:
                    Text("地圖")
                        .padding(.vertical, 3)
                        .frame(minWidth:0, maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(10)
                ) {
                    NavigationLink(
                        destination: MapView(player: $player, currentTime: $currentTime),
                        label: {
                            Image("map")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(30)
                        })
                }
            }
            .padding(.vertical, 60)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color("launchColor"), Color("bgColor")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
            .ignoresSafeArea()
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("遊戲")
                }
            })
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
