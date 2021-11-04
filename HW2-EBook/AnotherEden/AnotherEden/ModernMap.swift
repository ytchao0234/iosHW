//
//  ModernMap.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI
import AVKit

struct ModernMap: View {
    @Binding var player: AVPlayer
    
    var body: some View {
        VStack {
            VStack {
                Text("現代")
                    .padding(0.3)
                Text("Another Eden 的美術和音樂都非常精緻，每一張地圖都有不同的場景和音樂。根據任務進度不同，每次和 NPC 對話都有可能聽到不同的內容，也可以到地圖的各個角落尋找隱藏彩蛋哦！")
                    .font(.caption)
            }
            .padding()
            .background(Color.secondary.opacity(0.2))
            .cornerRadius(10)
            VStack {
                HStack {
                    VStack {
                        HStack {
                            NavigationLink(
                                destination: MapDetailView(map: Map(name: "月影之森", music: "", intro: "現代危險地圖"), player: $player),
                                label: {
                                    MapBlock(map: Map(name: "月影之森", music: "", intro: "現代危險地圖"))
                                })
                            NavigationLink(
                                destination: MapDetailView(map: Map(name: "瑟雷納海岸", music: "", intro: "現代危險地圖"), player: $player),
                                label: {
                                    MapBlock(map: Map(name: "瑟雷納海岸", music: "", intro: "現代危險地圖"))
                                })
                        }
                        HStack {
                            NavigationLink(
                                destination: MapDetailView(map: Map(name: "瑙亞路平原", music: "", intro: "現代危險地圖"), player: $player),
                                label: {
                                    MapBlock(map: Map(name: "瑙亞路平原", music: "", intro: "現代危險地圖"))
                                })
                            NavigationLink(
                                destination: MapDetailView(map: Map(name: "米格蘭斯城", music: "", intro: "現代安全地圖"), player: $player),
                                label: {
                                    MapBlock(map: Map(name: "米格蘭斯城", music: "", intro: "現代安全地圖"))
                                })
                            NavigationLink(
                                destination: MapDetailView(map: Map(name: "海港城鎮臨迪", music: "", intro: "現代安全地圖"), player: $player),
                                label: {
                                    MapBlock(map: Map(name: "海港城鎮臨迪", music: "", intro: "現代安全地圖"))
                                })
                        }
                    }
                    .frame(minWidth: 240, maxWidth: .infinity)
                    VStack {
                        NavigationLink(
                            destination: MapDetailView(map: Map(name: "露查那沙漠", music: "", intro: "現代危險地圖"), player: $player),
                            label: {
                                MapBlock(map: Map(name: "露查那沙漠", music: "", intro: "現代危險地圖"))
                            })
                        NavigationLink(
                            destination: MapDetailView(map: Map(name: "沙漠村莊沙爾博", music: "", intro: "現代安全地圖"), player: $player),
                            label: {
                                MapBlock(map: Map(name: "沙漠村莊沙爾博", music: "", intro: "現代安全地圖"))
                            })
                    }
                }

                HStack {
                    VStack {
                        HStack {
                            NavigationLink(
                                destination: MapDetailView(map: Map(name: "綠色村莊巴路奧其", music: "", intro: "現代安全地圖"), player: $player),
                                label: {
                                    MapBlock(map: Map(name: "綠色村莊巴路奧其", music: "", intro: "現代安全地圖"))
                                })
                            NavigationLink(
                                destination: MapDetailView(map: Map(name: "王都悠尼岡", music: "", intro: "現代安全地圖"), player: $player),
                                label: {
                                    MapBlock(map: Map(name: "王都悠尼岡", music: "", intro: "現代安全地圖"))
                                })
                        }
                        NavigationLink(
                            destination: MapDetailView(map: Map(name: "卡雷克濕原", music: "", intro: "現代危險地圖"), player: $player),
                            label: {
                                MapBlock(map: Map(name: "卡雷克濕原", music: "", intro: "現代危險地圖"))
                            })
                    }
                    .frame(minWidth: 180, maxWidth: .infinity)
                    
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "魔獸城", music: "", intro: "現代危險地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "魔獸城", music: "", intro: "現代危險地圖"))
                        })
                }
            }
        }
        .padding()
    }
}

struct ModernMap_Previews: PreviewProvider {
    @State static var player = AVPlayer(url: URL(string: "./BGM/Bgm_main_theme.ogg")!)
    
    static var previews: some View {
        NavigationView {
            ModernMap(player: $player)
        }
    }
}
