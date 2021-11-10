//
//  ModernMap.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI
import AVKit

struct ModernMap: View {
    @Binding var player: AVQueuePlayer
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: "arrow.backward.circle.fill")
                    Text("現代")
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
                    destination: MapDetailView(map: Map.defaultMap, player: $player),
                    label: {
                        MapBlock(map: Map.defaultMap)
                            .frame(width: UIScreen.main.bounds.width*0.12, height: UIScreen.main.bounds.width*0.12)
                    })
                VStack {
                    HStack {
                        VStack {
                            HStack {
                                NavigationLink(
                                    destination: MapDetailView(map: Map.modern[0], player: $player),
                                    label: {
                                        MapBlock(map: Map.modern[0])
                                    })
                                NavigationLink(
                                    destination: MapDetailView(map: Map.modern[1], player: $player),
                                    label: {
                                        MapBlock(map: Map.modern[1])
                                    })
                            }
                            HStack {
                                NavigationLink(
                                    destination: MapDetailView(map: Map.modern[2], player: $player),
                                    label: {
                                        MapBlock(map: Map.modern[2])
                                    })
                                NavigationLink(
                                    destination: MapDetailView(map: Map.modern[3], player: $player),
                                    label: {
                                        MapBlock(map: Map.modern[3])
                                    })
                                NavigationLink(
                                    destination: MapDetailView(map: Map.modern[4], player: $player),
                                    label: {
                                        MapBlock(map: Map.modern[4])
                                    })
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width*0.68)
                        VStack {
                            NavigationLink(
                                destination: MapDetailView(map: Map.modern[5], player: $player),
                                label: {
                                    MapBlock(map: Map.modern[5])
                                })
                            NavigationLink(
                                destination: MapDetailView(map: Map.modern[6], player: $player),
                                label: {
                                    MapBlock(map: Map.modern[6])
                                })
                        }
                    }

                    HStack {
                        VStack {
                            HStack {
                                NavigationLink(
                                    destination: MapDetailView(map: Map.modern[7], player: $player),
                                    label: {
                                        MapBlock(map: Map.modern[7])
                                    })
                                NavigationLink(
                                    destination: MapDetailView(map: Map.modern[8], player: $player),
                                    label: {
                                        MapBlock(map: Map.modern[8])
                                    })
                            }
                            NavigationLink(
                                destination: MapDetailView(map: Map.modern[9], player: $player),
                                label: {
                                    MapBlock(map: Map.modern[9])
                                })
                        }
                        .frame(width: UIScreen.main.bounds.width*0.55)
                        
                        NavigationLink(
                            destination: MapDetailView(map: Map.modern[10], player: $player),
                            label: {
                                MapBlock(map: Map.modern[10])
                            })
                    }
                }
            }
        }
        .padding()
    }
}

struct ModernMap_Previews: PreviewProvider {
    @State static var player = AVQueuePlayer()
    @State static var currentTime: Double = 0
    
    static var previews: some View {
        NavigationView {
            ModernMap(player: $player)
        }
    }
}
