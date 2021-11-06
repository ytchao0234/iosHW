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
                HStack {
                    Image(systemName: "arrow.backward.circle.fill")
                    Text("未來")
                    Image(systemName: "arrow.forward.circle.fill").hidden()
                }
                .padding(0.3)
                Text("Another Eden 的美術和音樂都非常精緻，每一張地圖都有不同的場景和音樂。根據任務進度不同，每次和 NPC 對話都有可能聽到不同的內容，也可以到地圖的各個角落尋找隱藏彩蛋哦！")
                    .font(.caption)
            }
            .padding()
            .background(Color.secondary.opacity(0.2))
            .cornerRadius(10)
            
            VStack {
                VStack {
                    HStack {
                        NavigationLink(
                            destination: MapDetailView(map: Map.future[0], player: $player),
                            label: {
                                MapBlock(map: Map.future[0])
                            })
                        NavigationLink(
                            destination: MapDetailView(map: Map.future[1], player: $player),
                            label: {
                                MapBlock(map: Map.future[1])
                                    .frame(width: UIScreen.main.bounds.width*0.35)
                            })
                        NavigationLink(
                            destination: MapDetailView(map: Map.future[2], player: $player),
                            label: {
                                MapBlock(map: Map.future[2])
                            })
                    }
                    HStack {
                        NavigationLink(
                            destination: MapDetailView(map: Map.future[3], player: $player),
                            label: {
                                MapBlock(map: Map.future[3])
                            })
                        NavigationLink(
                            destination: MapDetailView(map: Map.future[4], player: $player),
                            label: {
                                MapBlock(map: Map.future[4])
                            })
                        NavigationLink(
                            destination: MapDetailView(map: Map.future[5], player: $player),
                            label: {
                                MapBlock(map: Map.future[5])
                                    .frame(width: UIScreen.main.bounds.width*0.32)
                            })
                        NavigationLink(
                            destination: MapDetailView(map: Map.future[6], player: $player),
                            label: {
                                MapBlock(map: Map.future[6])
                            })
                    }
                }
                .frame(height: UIScreen.main.bounds.height*0.4)
                HStack {
                    NavigationLink(
                        destination: MapDetailView(map: Map.future[7], player: $player),
                        label: {
                            MapBlock(map: Map.future[7])
                                .frame(minWidth: 220, maxWidth: .infinity)
                        })
                    NavigationLink(
                        destination: MapDetailView(map: Map.future[8], player: $player),
                        label: {
                            MapBlock(map: Map.future[8])
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
