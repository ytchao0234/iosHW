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
    @Binding var player: AVQueuePlayer
    @State private var show: Bool = false
    @State private var play: Bool = true
    @State private var currentTime = CMTime.zero
    @State private var timer: Timer?
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("launchColor"), Color("bgColor")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
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
                                self.player.seek(to: .zero)
                                self.player.play()
                                
                                self.timer?.invalidate()
                                self.timer = Timer.scheduledTimer(
                                    withTimeInterval: self.player.currentItem?.asset.duration.seconds ?? 0,
                                    repeats: false,
                                    block: { _ in
                                        self.play = false
                                        self.player.pause()
                                    }
                                )
                            }
                            else {
                                self.player.pause()
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
            .padding()
        }
        .onAppear {
            if character.name != "草人小子" {
                self.player.pause()
                self.currentTime = self.player.currentTime()
                self.player.replaceCurrentItem(with: character.voice)
                self.player.seek(to: .zero)
                self.player.volume = 1
                self.player.play()

                self.timer?.invalidate()
                self.timer = Timer.scheduledTimer(
                    withTimeInterval: self.player.currentItem?.asset.duration.seconds ?? 0,
                    repeats: false,
                    block: { _ in
                        self.play = false
                        self.player.pause()
                    }
                )
            }
        }
        .onDisappear {
            self.timer?.invalidate()
            self.player.pause()
            self.player.replaceCurrentItem(with: BGM)
            self.player.seek(to: self.currentTime)
            self.player.volume = 0.2
            self.player.play()
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text(character.name)
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    @State static var player = AVQueuePlayer()
    
    static var previews: some View {
//        NavigationView {
        CharacterDetailView(character: Character.main.first!, player: $player)
//        }
    }
}
