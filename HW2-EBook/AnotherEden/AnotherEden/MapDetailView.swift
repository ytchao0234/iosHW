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
    @State private var show: Bool = false
    
    var body: some View {
        return ScrollView {
            TabView {
                ForEach(map.name, id: \.self) { name in
                    Image(name)
                        .resizable()
                        .scaledToFit()
                        .opacity(show ? 1: 0)
                        .scaleEffect(show ? 1: 0.1)
                        .rotationEffect(show ? .zero : Angle(degrees: 90))
                        .animation(.easeInOut(duration: 1), value: show)
                        .onAppear {
                            show = true
                        }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Text(map.intro)
        }
        .padding(.top, 100)
        .padding(.horizontal, 10)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color("launchColor"), Color("bgColor")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
        .ignoresSafeArea()
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
                Text(map.name.first!)
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
