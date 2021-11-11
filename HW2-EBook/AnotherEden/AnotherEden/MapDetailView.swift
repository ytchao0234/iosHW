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
    @Binding var player: AVQueuePlayer
    @State private var show: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("launchColor"), Color("bgColor")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach(map.name, id: \.self) { name in
                        Image(name)
                            .resizable()
                            .scaledToFit()
                            .opacity(show ? 1: 0)
                            .scaleEffect(show ? 1: 0.3)
                            .animation(.easeInOut(duration: 1), value: show)
                            .onAppear {
                                show = true
                            }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            self.player.pause()
            self.player.replaceCurrentItem(with: map.music)
            self.player.seek(to: .zero)
            self.player.volume = 1
            self.player.play()
        }
        .onDisappear {
            self.player.pause()
            self.player.replaceCurrentItem(with: BGM)
            self.player.volume = 0.2
            self.player.play()
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text(map.name.first!)
                    .font(.custom("Yuppy TC Regular", size: 18))
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MapDetailView_Previews: PreviewProvider {
    @State static var player = AVQueuePlayer()
    
    static var previews: some View {
        MapDetailView(map: Map.defaultMap, player: $player)
    }
}
