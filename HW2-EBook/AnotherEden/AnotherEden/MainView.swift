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
    @State private var timeControlObservation: NSKeyValueObservation?
    
    var body: some View {
        ScrollView(.vertical) {
            
            Image("AnotherEden")
                .resizable()
                .scaledToFit()
            
            VideoPlayer(player: videoPlayer)
                .scaledToFit()
                .onAppear {
                    timeControlObservation = videoPlayer.observe(
                        \AVPlayer.timeControlStatus,
                        options: [.old, .new]
                    ) { (player, change) in
                        if videoPlayer.timeControlStatus.rawValue == 0 {
                            self.player?.play()
                        }
                        else if videoPlayer.timeControlStatus.rawValue == 2 {
                            self.player?.pause()
                        }
                    }
                }
                .onDisappear {
                    videoPlayer.pause()
                    self.player?.play()
                }
            
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
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.black)
                            .frame(height: 30)
                            .padding()
                })
                Link(destination: URL(string: "https://www.apple.com")!, label: {
                    Image("AEicon")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .padding()
                })
                Link(destination: URL(string: "https://www.apple.com")!, label: {
                    Image("facebook")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .padding()
                })
                Link(destination: URL(string: "https://www.apple.com")!, label: {
                    Image("youtube")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .padding()
                })
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
