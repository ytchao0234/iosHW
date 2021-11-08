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
    @Binding var currentTime: Double
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            AncientMap(player: $player, currentTime: $currentTime)
                .tag(0)
            ModernMap(player: $player, currentTime: $currentTime)
                .tag(1)
            FutureMap(player: $player, currentTime: $currentTime)
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .padding(.vertical, 100)
        .padding(.horizontal, 10)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color("launchColor"), Color("bgColor")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
        .ignoresSafeArea()
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("地圖")
            }
        })
    }
}

struct MapView_Previews: PreviewProvider {
    @State static var player: AVAudioPlayer?
    @State static var currentTime: Double = 0
    
    static var previews: some View {
        NavigationView {
            MapView(player: $player, currentTime: $currentTime)
        }
    }
}

struct MapBlock: View {
    var map: Map
    
    var body: some View {
        Image(map.name.first! + "icon")
            .resizable()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .cornerRadius(5)
    }
}

struct Map: Identifiable {
    let id = UUID()
    
    let name: [String]
    let music: String
    let intro: String
}

extension Map {
    static let defaultMap = Map(name: ["次元夾縫", "時間遺忘的小站"], music: "Bgm_field_time_forgot", intro: "次元夾縫")
    
    static let ancient = [Map(name: ["星之塔"], music: "Bgm_dungeon_general_tower", intro: "古代危險地圖"),
                          Map(name: ["柯林達平原"], music: "Bgm_field_ancient", intro: "古代危險地圖"),
                          Map(name: ["納達拉火山"], music: "Bgm_dungeon_nadara", intro: "古代危險地圖"),
                          Map(name: ["查諾魯草原"], music: "Bgm_field_ancient", intro: "古代危險地圖"),
                          Map(name: ["戴利斯摩街道"], music: "Bgm_field_ancient", intro: "古代危險地圖"),
                          Map(name: ["帕西法爾宮殿"], music: "Bgm_town_palcifal", intro: "古代安全地圖"),
                          Map(name: ["巴紹山岳"], music: "Bgm_field_ancient", intro: "古代危險地圖"),
                          Map(name: ["草原之村薩魯帕"], music: "Bgm_town_general_ancient", intro: "古代安全地圖"),
                          Map(name: ["崎路里之路"], music: "Bgm_field_ancient", intro: "古代危險地圖"),
                          Map(name: ["食人沼澤"], music: "Bgm_dungeon_general_bog", intro: "古代危險地圖"),
                          Map(name: ["火之村拉多路"], music: "Bgm_town_rattle", intro: "古代安全地圖"),
                          Map(name: ["時之塔"], music: "Bgm_dungeon_general_tower", intro: "古代危險地圖"),
                          Map(name: ["水都艾古圖"], music: "Bgm_town_actool", intro: "古代安全地圖"),
                          Map(name: ["天憐湖"], music: "Bgm_field_ancient", intro: "古代危險地圖"),
                          Map(name: ["早陸平原"], music: "Bgm_field_ancient", intro: "古代危險地圖")]
    
    static let modern = [Map(name: ["月影之森"], music: "Bgm_dungeon_general_forest", intro: "現代危險地圖"),
                         Map(name: ["瑟雷納海岸"], music: "Bgm_field_modern", intro: "現代危險地圖"),
                         Map(name: ["瑙亞路平原"], music: "Bgm_field_modern", intro: "現代危險地圖"),
                         Map(name: ["米格蘭斯城"], music: "Bgm_town_unigan", intro: "現代安全地圖"),
                         Map(name: ["海港城鎮臨迪"], music: "Bgm_town_general_modern", intro: "現代安全地圖"),
                         Map(name: ["露查那沙漠"], music: "Bgm_field_modern", intro: "現代危險地圖"),
                         Map(name: ["沙漠村莊沙爾博"], music: "Bgm_town_general_modern", intro: "現代安全地圖"),
                         Map(name: ["綠色村莊巴路奧其"], music: "Bgm_town_baruoky", intro: "現代安全地圖"),
                         Map(name: ["王都悠尼岡"], music: "Bgm_town_unigan", intro: "現代安全地圖"),
                         Map(name: ["卡雷克濕原"], music: "Bgm_field_modern", intro: "現代危險地圖"),
                         Map(name: ["魔獸城", "魔獸城入口"], music: "Bgm_dungeon_beast_castle", intro: "現代危險地圖")]
    
    static let future = [Map(name: ["浮游街道涅瓦"], music: "Bgm_town_elgion", intro: "未來安全地圖"),
                         Map(name: ["傑諾領域"], music: "Bgm_dungeon_xeno_domain", intro: "未來危險地圖"),
                         Map(name: ["邊緣之島"], music: "Bgm_sad", intro: "未來安全地圖"),
                         Map(name: ["工業都市廢墟"], music: "Bgm_dungeon_general_maze", intro: "未來危險地圖"),
                         Map(name: ["廢棄公路99"], music: "Bgm_field_future", intro: "未來危險地圖"),
                         Map(name: ["曙光都市艾路茲恩"], music: "Bgm_town_elgion", intro: "未來安全地圖"),
                         Map(name: ["艾路茲恩機場"], music: "Bgm_field_future", intro: "未來危險地圖"),
                         Map(name: ["次元戰艦"], music: "Bgm_storm", intro: "未來安全地圖"),
                         Map(name: ["琉萊巨蛋"], music: "Bgm_town_raula_dome", intro: "未來安全地圖")]
}
