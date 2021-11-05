//
//  FutureMap.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI
import AVKit

struct FutureMap: View {
    @Binding var player: AVAudioPlayer?
    
    var body: some View {
        VStack {
            VStack {
                Text("未來")
                    .padding(0.3)
                Text("Another Eden 的美術和音樂都非常精緻，每一張地圖都有不同的場景和音樂。根據任務進度不同，每次和 NPC 對話都有可能聽到不同的內容，也可以到地圖的各個角落尋找隱藏彩蛋哦！")
                    .font(.caption)
            }
            .padding()
            .background(Color.secondary.opacity(0.2))
            .cornerRadius(10)
            VStack {
                HStack {
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "浮游街道涅瓦", music: "", intro: "未來安全地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "浮游街道涅瓦", music: "", intro: "未來安全地圖"))
                        })
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "傑諾領域", music: "", intro: "未來危險地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "傑諾領域", music: "", intro: "未來危險地圖"))
                                .frame(minWidth: 130, maxWidth: .infinity)
                        })
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "邊緣之島", music: "", intro: "未來安全地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "邊緣之島", music: "", intro: "未來安全地圖"))
                        })
                }
                HStack {
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "工業都市廢墟", music: "", intro: "未來危險地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "工業都市廢墟", music: "", intro: "未來危險地圖"))
                        })
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "廢棄公路99", music: "", intro: "未來危險地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "廢棄公路99", music: "", intro: "未來危險地圖"))
                        })
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "曙光都市艾路茲恩", music: "", intro: "未來安全地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "曙光都市艾路茲恩", music: "", intro: "未來安全地圖"))
                                .frame(minWidth: 110, maxWidth: .infinity)
                        })
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "艾路茲恩機場", music: "", intro: "未來危險地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "艾路茲恩機場", music: "", intro: "未來危險地圖"))
                        })
                }
                HStack {
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "次元戰艦", music: "", intro: "未來安全地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "次元戰艦", music: "", intro: "未來安全地圖"))
                                .frame(minWidth: 220, maxWidth: .infinity)
                        })
                    NavigationLink(
                        destination: MapDetailView(map: Map(name:"琉萊巨蛋", music: "", intro: "未來安全地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name:"琉萊巨蛋", music: "", intro: "未來安全地圖"))
                        })
                }
            }
        }
        .padding()
    }
}

struct FutureMap_Previews: PreviewProvider {
    @State static var player: AVAudioPlayer?
    
    static var previews: some View {
        NavigationView {
            FutureMap(player: $player)
        }
    }
}
