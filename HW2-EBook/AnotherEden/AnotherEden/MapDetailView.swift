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
    @Binding var currentTime: Double
    @State private var show: Bool = false
    
    var body: some View {
        return ScrollView {
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
        }
        .padding(.top, 100)
        .padding(.bottom, 80)
        .padding(.horizontal, 10)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color("launchColor"), Color("bgColor")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
        .ignoresSafeArea()
        .onAppear {
            if let sound = Bundle.main.url(forResource: map.music, withExtension: "mp3") {
                do {
                    self.currentTime = (self.player?.currentTime)!
                    player?.stop()
                    try self.player = AVAudioPlayer(contentsOf: sound)
                    self.player?.numberOfLoops = .max
                    self.player?.volume = 0.5
                    self.player?.play()
                }
                catch {
                    print("error: \(error)")
                }
            }
        }
        .onDisappear {
            if let sound = Bundle.main.url(forResource: "Bgm_main_theme", withExtension: "mp3") {
                do {
                    self.player?.stop()
                    try self.player = AVAudioPlayer(contentsOf: sound)
                    self.player?.numberOfLoops = .max
                    self.player?.volume = 0.2
                    self.player?.currentTime = self.currentTime
                    self.player?.play()
                }
                catch {
                    print("error: \(error)")
                }
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text(map.name.first!)
            }
        })
    }
}

struct MapDetailView_Previews: PreviewProvider {
    @State static var player: AVAudioPlayer?
    @State static var currentTime: Double = 0
    
    static var previews: some View {
        MapDetailView(map: Map.defaultMap, player: $player, currentTime: $currentTime)
    }
}
