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
    @Binding var currentTime: Double
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: "arrow.backward.circle.fill").hidden()
                    Text("古代")
                    Image(systemName: "arrow.forward.circle.fill")
                }
                .padding(0.3)
                Text("Another Eden 的美術和音樂都非常精緻，每一張地圖都有各自的場景和音樂。根據任務進度不同，每次和 NPC 對話都有可能聽到不同的內容，也可以到地圖的各個角落尋找隱藏彩蛋哦！")
                    .font(.caption)
            }
            .padding()
            .background(Color.secondary.opacity(0.2))
            .cornerRadius(10)
            
            VStack {
                NavigationLink(
                    destination: MapDetailView(map: Map.defaultMap, player: $player, currentTime: $currentTime),
                    label: {
                        MapBlock(map: Map.defaultMap)
                            .frame(width: UIScreen.main.bounds.width*0.12, height: UIScreen.main.bounds.width*0.12)
                    })
                VStack {
                    HStack {
                        NavigationLink(
                            destination: MapDetailView(map: Map.ancient[0], player: $player, currentTime: $currentTime),
                            label: {
                                MapBlock(map: Map.ancient[0])
                            })
                        NavigationLink(
                            destination: MapDetailView(map: Map.ancient[1], player: $player, currentTime: $currentTime),
                            label: {
                                MapBlock(map: Map.ancient[1])
                                    .frame(width: UIScreen.main.bounds.width*0.3)
                            })
                        NavigationLink(
                            destination: MapDetailView(map: Map.ancient[2], player: $player, currentTime: $currentTime),
                            label: {
                                MapBlock(map: Map.ancient[2])
                            })
                        NavigationLink(
                            destination: MapDetailView(map: Map.ancient[3], player: $player, currentTime: $currentTime),
                            label: {
                                MapBlock(map: Map.ancient[3])
                            })
                    }
                    HStack {
                        NavigationLink(
                            destination: MapDetailView(map: Map.ancient[4], player: $player, currentTime: $currentTime),
                            label: {
                                MapBlock(map: Map.ancient[4])
                            })
                        NavigationLink(
                            destination: MapDetailView(map: Map.ancient[5], player: $player, currentTime: $currentTime),
                            label: {
                                MapBlock(map: Map.ancient[5])
                            })
                        NavigationLink(
                            destination: MapDetailView(map: Map.ancient[6], player: $player, currentTime: $currentTime),
                            label: {
                                MapBlock(map: Map.ancient[6])
                                    .frame(width: UIScreen.main.bounds.width*0.3)
                            })
                        NavigationLink(
                            destination: MapDetailView(map: Map.ancient[7], player: $player, currentTime: $currentTime),
                            label: {
                                MapBlock(map: Map.ancient[7])
                            })
                    }
                    HStack {
                        VStack {
                            HStack {
                                NavigationLink(
                                    destination: MapDetailView(map: Map.ancient[8], player: $player, currentTime: $currentTime),
                                    label: {
                                        MapBlock(map: Map.ancient[8])
                                            .frame(width: UIScreen.main.bounds.width*0.25)
                                    })
                                NavigationLink(
                                    destination: MapDetailView(map: Map.ancient[9], player: $player, currentTime: $currentTime),
                                    label: {
                                        MapBlock(map: Map.ancient[9])
                                    })
                                NavigationLink(
                                    destination: MapDetailView(map: Map.ancient[10], player: $player, currentTime: $currentTime),
                                    label: {
                                        MapBlock(map: Map.ancient[10])
                                    })
                            }
                            HStack {
                                NavigationLink(
                                    destination: MapDetailView(map: Map.ancient[11], player: $player, currentTime: $currentTime),
                                    label: {
                                        MapBlock(map: Map.ancient[11])
                                    })
                                NavigationLink(
                                    destination: MapDetailView(map: Map.ancient[12], player: $player, currentTime: $currentTime),
                                    label: {
                                        MapBlock(map: Map.ancient[12])
                                    })
                                NavigationLink(
                                    destination: MapDetailView(map: Map.ancient[13], player: $player, currentTime: $currentTime),
                                    label: {
                                        MapBlock(map: Map.ancient[13])
                                    })
                            }
                            .frame(height: UIScreen.main.bounds.height*0.12)
                        }
                        .frame(width: UIScreen.main.bounds.width*0.65)
                        
                        NavigationLink(
                            destination: MapDetailView(map: Map.ancient[14], player: $player, currentTime: $currentTime),
                            label: {
                                MapBlock(map: Map.ancient[14])
                            })
                        
                    }
                    .frame(height: UIScreen.main.bounds.height*0.25)
                }
            }
        }
        .padding()
    }
}

struct AncientMap_Previews: PreviewProvider {
    @State static var player: AVAudioPlayer?
    @State static var currentTime: Double = 0
    
    static var previews: some View {
        NavigationView {
            AncientMap(player: $player, currentTime: $currentTime)
        }
    }
}
