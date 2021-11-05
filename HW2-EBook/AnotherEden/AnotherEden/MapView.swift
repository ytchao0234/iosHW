//
//  MapView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI
import AVKit

struct MapView: View {
    @Binding var player: AVAudioPlayer?
    
    var body: some View {
        TabView {
            AncientMap(player: $player)
            ModernMap(player: $player)
            FutureMap(player: $player)
        }
        .tabViewStyle(PageTabViewStyle())
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("地圖")
            }
        })
    }
}

struct MapView_Previews: PreviewProvider {
    @State static var player: AVAudioPlayer?
    
    static var previews: some View {
        NavigationView {
            MapView(player: $player)
        }
    }
}

struct MapBlock: View {
    var map: Map
    
    var body: some View {
        Image(map.name + "icon")
            .resizable()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .cornerRadius(5)
    }
}

struct Map: Identifiable {
    let id = UUID()
    
    let name: String
    let music: String
    let intro: String
}

extension Map {
    static let defaultMap = Map(name: "綠色村莊巴路奧其", music: "Bgm_town_baruoky", intro: "現代安全地圖")
}
