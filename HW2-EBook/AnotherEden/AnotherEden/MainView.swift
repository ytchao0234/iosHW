//
//  MainView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI
import AVKit

struct MainView: View {
    var body: some View {
            List {
                Image("AnotherEden")
                    .resizable()
                    .scaledToFit()
    //
    //            VideoPlayer(player: AVPlayer(url: URL(string: "")!))
                
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
    static var previews: some View {
        NavigationView {
            MainView()
        }
    }
}
