//
//  CharacterDetailView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI
import AVKit

struct CharacterDetailView: View {
    var character: Character
    @Binding var player: AVAudioPlayer?
    @Binding var currentTime: Double
    @State private var show: Bool = false
    @State private var play: Bool = true
    @State private var timer: Timer?
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                Image(character.name)
                    .resizable()
                    .scaledToFit()
                    .opacity(show ? 1: 0)
                    .scaleEffect(show ? 1: 0.1)
                    .rotationEffect(show ? .zero : Angle(degrees: 90))
                    .animation(.easeInOut(duration: 1), value: show)
                    .onAppear {
                        show = true
                    }
                Button(action: {
                    if character.name != "草人小子" {
                        self.play = !self.play
                        
                        if self.play {
                            self.player?.play()
                            
                            self.timer?.invalidate()
                            self.timer = Timer.scheduledTimer(
                                withTimeInterval: Double(self.player!.duration),
                                repeats: false,
                                block: { _ in
                                    self.play = false
                                    self.player?.stop()
                                    self.player?.currentTime = 0
                                }
                            )
                        }
                        else {
                            self.player?.stop()
                            self.player?.currentTime = 0
                        }
                    }
                    
                }, label: {
                    if character.name != "草人小子" {
                        Image(systemName: play ? "stop.circle" : "play.circle")
                    }
                    else {
                        Text("無語音")
                            .font(.caption)
                    }
                })
                .offset(y: 25)
            }
            VStack {
                HStack {
                    Text(character.name)
                    
                    if character.time != "" {
                        Image(character.time + "icon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 15, height: 15)
                    }
                }
                Text("CV: " + character.cv)
                    .font(.caption)
            }
            .padding(.bottom)

            if character.story != "" {
                Image(character.story)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width*0.6)

                Text("劇情故事: " + character.story)
                    .font(.caption)
            }

            Text(character.intro)
                .padding()
        }
        .padding(.top, 100)
        .padding(.bottom, 80)
        .padding(.horizontal, 10)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color("launchColor"), Color("bgColor")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
        .ignoresSafeArea()
        .onAppear {
            if character.name != "草人小子", let sound = Bundle.main.url(forResource: character.name, withExtension: "mp3") {
                do {
                    self.currentTime = (self.player?.currentTime)!
                    player?.stop()
                    try self.player = AVAudioPlayer(contentsOf: sound)
                    self.player?.numberOfLoops = 0
                    self.player?.play()
                    
                    self.timer?.invalidate()
                    self.timer = Timer.scheduledTimer(
                        withTimeInterval: Double(self.player!.duration),
                        repeats: false,
                        block: { _ in
                            self.play = false
                            self.player?.stop()
                            self.player?.currentTime = 0
                        }
                    )
                }
                catch {
                    print("error: \(error)")
                }
            }
        }
        .onDisappear {
            if character.name != "草人小子", let sound = Bundle.main.url(forResource: "Bgm_main_theme", withExtension: "mp3") {
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
                Text(character.name)
            }
        })
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    @State static var player: AVAudioPlayer?
    @State static var currentTime: Double = 0
    
    static var previews: some View {
//        NavigationView {
        CharacterDetailView(character: Character.main.first!, player: $player, currentTime: $currentTime)
//        }
    }
}
