//
//  AncientMap.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI
import AVKit

struct AncientMap: View {
    @Binding var player: AVAudioPlayer?
    
    var body: some View {
        VStack {
            VStack {
                Text("古代")
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
                        destination: MapDetailView(map: Map(name: "星之塔", music: "", intro: "古代危險地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "星之塔", music: "", intro: "古代危險地圖"))
                        })
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "柯林達平原", music: "", intro: "古代危險地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "柯林達平原", music: "", intro: "古代危險地圖"))
                                .frame(minWidth: 110, maxWidth: .infinity)
                        })
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "納達拉火山", music: "", intro: "古代危險地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "納達拉火山", music: "", intro: "古代危險地圖"))
                        })
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "查諾魯草原", music: "", intro: "古代危險地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "查諾魯草原", music: "", intro: "古代危險地圖"))
                        })
                }
                HStack {
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "戴利斯摩街道", music: "", intro: "古代危險地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "戴利斯摩街道", music: "", intro: "古代危險地圖"))
                        })
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "帕西法爾宮殿", music: "", intro: "古代安全地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "帕西法爾宮殿", music: "", intro: "古代安全地圖"))
                        })
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "巴紹山岳", music: "", intro: "古代危險地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "巴紹山岳", music: "", intro: "古代危險地圖"))
                                .frame(minWidth: 110, maxWidth: .infinity)
                        })
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "草原之村薩魯帕", music: "", intro: "古代安全地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "草原之村薩魯帕", music: "", intro: "古代安全地圖"))
                        })
                }
                HStack {
                    VStack {
                        HStack {
                            NavigationLink(
                                destination: MapDetailView(map: Map(name: "崎路里之路", music: "", intro: "古代危險地圖"), player: $player),
                                label: {
                                    MapBlock(map: Map(name: "崎路里之路", music: "", intro: "古代危險地圖"))
                                        .frame(minWidth: 100, maxWidth: .infinity)
                                })
                            NavigationLink(
                                destination: MapDetailView(map: Map(name: "食人沼澤", music: "", intro: "古代危險地圖"), player: $player),
                                label: {
                                    MapBlock(map: Map(name: "食人沼澤", music: "", intro: "古代危險地圖"))
                                })
                            NavigationLink(
                                destination: MapDetailView(map: Map(name: "火之村拉多路", music: "", intro: "古代安全地圖"), player: $player),
                                label: {
                                    MapBlock(map: Map(name: "火之村拉多路", music: "", intro: "古代安全地圖"))
                                })
                        }
                        HStack {
                            NavigationLink(
                                destination: MapDetailView(map: Map(name: "時之塔", music: "", intro: "古代危險地圖"), player: $player),
                                label: {
                                    MapBlock(map: Map(name: "時之塔", music: "", intro: "古代危險地圖"))
                                })
                            NavigationLink(
                                destination: MapDetailView(map: Map(name: "水都艾古圖", music: "", intro: "古代安全地圖"), player: $player),
                                label: {
                                    MapBlock(map: Map(name: "水都艾古圖", music: "", intro: "古代安全地圖"))
                                })
                            NavigationLink(
                                destination: MapDetailView(map: Map(name: "天憐湖", music: "", intro: "古代危險地圖"), player: $player),
                                label: {
                                    MapBlock(map: Map(name: "天憐湖", music: "", intro: "古代危險地圖"))
                                })
                        }
                        .frame(minHeight: 100, maxHeight: .infinity)
                    }
                    .frame(minWidth: 220, maxWidth: .infinity)
                    
                    NavigationLink(
                        destination: MapDetailView(map: Map(name: "早陸平原", music: "", intro: "古代危險地圖"), player: $player),
                        label: {
                            MapBlock(map: Map(name: "早陸平原", music: "", intro: "古代危險地圖"))
                        })
                    
                }
                .frame(minHeight: 200, maxHeight: .infinity)
            }
        }
        .padding()
    }
}

struct AncientMap_Previews: PreviewProvider {
    @State static var player: AVAudioPlayer?
    
    static var previews: some View {
        NavigationView {
            AncientMap(player: $player)
        }
    }
}
