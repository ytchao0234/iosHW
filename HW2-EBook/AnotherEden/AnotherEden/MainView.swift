//
//  MainView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI
import AVKit

struct MainView: View {
    @Binding var player: AVQueuePlayer
    @State private var videoPlayer = AVPlayer(url: Bundle.main.url(forResource: "宣傳影片", withExtension: "mp4")!)
    @State private var timeControlObservation: NSKeyValueObservation?
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("launchColor"), Color("bgColor")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .ignoresSafeArea()
                VStack {
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
                                    self.player.play()
                                }
                                else if videoPlayer.timeControlStatus.rawValue == 2 {
                                    self.player.pause()
                                }
                            }
                        }
                        .onDisappear {
                            videoPlayer.pause()
                            self.player.play()
                        }
                    
                    HStack {
                        NavigationLink(
                            destination: IconView(),
                            label: {
                                Image(systemName: "gearshape.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color("gearColor"))
                                    .padding(10)
                        })
                        Link(destination: URL(string: "https://tw.another-eden.jp")!, label: {
                            Image("AEicon")
                                .resizable()
                                .scaledToFit()
                                .padding(10)
                        })
                        Link(destination: URL(string: "https://www.facebook.com/AnotherEdenRPG.tw")!, label: {
                            Image("facebook")
                                .resizable()
                                .scaledToFit()
                                .padding(10)
                        })
                        Link(destination: URL(string: "https://www.youtube.com/channel/UCbXzDM-cpEYhBnbxV38Aujw")!, label: {
                            Image("youtube")
                                .resizable()
                                .scaledToFit()
                                .padding(10)
                        })
                    }
                }
                .padding()
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("主頁")
                        .font(.custom("Yuppy TC Regular", size: 18))
                }
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    @State static var player = AVQueuePlayer()
    
    static var previews: some View {
        MainView(player: $player)
    }
}
