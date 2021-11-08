//
//  CharacterDetailView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    @Binding var player: AVAudioPlayer?
    @State private var show: Bool = false
    
    var body: some View {
        ScrollView {
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
            HStack {
                Text(character.name)

                if character.time != nil {
                    Image(character.time + "icon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                }
            }

            if character.story != nil {
                Image(character.story)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.wisth*0.4)

                Text("劇情故事: " + character.story)
                    .font(.caption)
            }

            Text(character.intro)
        }
        .padding(.top, 100)
        .padding(.horizontal, 10)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color("launchColor"), Color("bgColor")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
        .ignoresSafeArea()
        .onAppear {
            print(map.music)
            if let sound = Bundle.main.url(forResource: character.name, withExtension: "mp3") {
                do {
                    player?.stop()
                    try self.player = AVAudioPlayer(contentsOf: sound)
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
    static var previews: some View {
//        NavigationView {
            CharacterDetailView(character: Character.main.first!)
//        }
    }
}
