//
//  MainView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI
import AVKit

struct MainView: View {
    @Binding var player: AVAudioPlayer?
    @State private var videoPlayer = AVPlayer(url: Bundle.main.url(forResource: "宣傳影片", withExtension: "mp4")!)
    
    var body: some View {
        List {
            Image("AnotherEden")
                .resizable()
                .scaledToFit()
            
            VideoPlayer(player: videoPlayer)
                .scaledToFit()
                .onChange(of: videoPlayer.rate, perform: { value in
                    if value != 0 {
                        player?.pause()
                    } else {
                        player?.play()
                    }
                })
            
            Text("遊戲簡介")
                .font(.title)
            Text("...")
            
            Text("劇情背景")
                .font(.title)
            Text("...")
            
            Text("遊戲方式")
                .font(.title)
            Text("...")
            
            HStack {
                Spacer()
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .padding()
                Image("AEicon")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .padding()
                Image("facebook")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .padding()
                Image("youtube")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .padding()
                Spacer()
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("簡介")
            }
        })
    }
}

struct MainView_Previews: PreviewProvider {
    @State static var player: AVAudioPlayer?
    
    static var previews: some View {
        NavigationView {
            MainView(player: $player)
        }
    }
}
