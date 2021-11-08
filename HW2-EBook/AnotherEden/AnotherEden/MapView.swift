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
}

extension Map {
    static let defaultMap = Map(name: ["次元夾縫", "時間遺忘的小站", "店主chat"], music: "Bgm_field_time_forgot")
    
    static let ancient = [Map(name: ["星之塔", "星之塔0", "星之塔1"], music: "Bgm_dungeon_general_tower"),
                          Map(name: ["柯林達平原", "柯林達平原0", "柯林達平原1", "柯林達平原2"], music: "Bgm_field_ancient"),
                          Map(name: ["納達拉火山", "納達拉火山0", "納達拉火山1"], music: "Bgm_dungeon_nadara"),
                          Map(name: ["查諾魯草原", "查諾魯草原0", "查諾魯草原1"], music: "Bgm_field_ancient"),
                          Map(name: ["戴利斯摩街道", "戴利斯摩街道0", "戴利斯摩街道1", "戴利斯摩街道2"], music: "Bgm_field_ancient"),
                          Map(name: ["帕西法爾宮殿", "拉切特chat", "帕西法爾宮殿0", "帕西法爾宮殿1", "帕西法爾宮殿2", "帕西法爾宮殿3", "帕西法爾宮殿4", "帕西法爾宮殿5", "帕西法爾宮殿6", "帕西法爾宮殿7", "帕西法爾宮殿8", "帕西法爾宮殿9", "帕西法爾宮殿10"], music: "Bgm_town_palcifal"),
                          Map(name: ["巴紹山岳", "巴紹山岳0", "巴紹山岳1"], music: "Bgm_field_ancient"),
                          Map(name: ["草原之村薩魯帕", "薩魯帕0", "薩魯帕1", "薩魯帕2", "薩魯帕3", "薩魯帕4"], music: "Bgm_town_general_ancient"),
                          Map(name: ["崎路里之路", "崎路里之路0", "崎路里之路1"], music: "Bgm_field_ancient"),
                          Map(name: ["食人沼澤", "食人沼澤0", "食人沼澤1"], music: "Bgm_dungeon_general_bog"),
                          Map(name: ["火之村拉多路", "拉多路0", "拉多路1", "拉多路2", "拉多路3", "拉多路4", "拉多路5", "拉多路6"], music: "Bgm_town_rattle"),
                          Map(name: ["時之塔", "時之塔0", "時之塔1"], music: "Bgm_dungeon_general_tower"),
                          Map(name: ["水都艾古圖", "艾古圖0", "艾古圖1", "艾古圖2", "艾古圖3", "艾古圖4", "艾古圖5", "艾古圖6", "艾古圖7", "艾古圖8", "艾古圖9"], music: "Bgm_town_actool"),
                          Map(name: ["天憐湖", "天憐湖0", "天憐湖1"], music: "Bgm_field_ancient"),
                          Map(name: ["早陸平原", "早陸平原0", "早陸平原1"], music: "Bgm_field_ancient")]
    
    static let modern = [Map(name: ["月影之森", "月影之森0", "月影之森1"], music: "Bgm_dungeon_general_forest"),
                         Map(name: ["瑟雷納海岸", "瑟雷納海岸0", "瑟雷納海岸1"], music: "Bgm_field_modern"),
                         Map(name: ["瑙亞路平原", "瑙亞路平原0", "瑙亞路平原1"], music: "Bgm_field_modern"),
                         Map(name: ["米格蘭斯城", "米格蘭斯王chat", "米格蘭斯城0", "米格蘭斯城1", "米格蘭斯城2", "米格蘭斯城3", "米格蘭斯城4", "米格蘭斯城5"], music: "Bgm_town_unigan"),
                         Map(name: ["海港城鎮臨迪", "臨迪0", "臨迪1", "臨迪2", "臨迪3", "臨迪4"], music: "Bgm_town_general_modern"),
                         Map(name: ["露查那沙漠", "露查那沙漠0", "露查那沙漠1", "露查那沙漠2", "露查那沙漠3"], music: "Bgm_field_modern"),
                         Map(name: ["沙漠村莊沙爾博", "沙爾博0", "沙爾博1", "沙爾博2", "沙爾博3", "沙爾博4"], music: "Bgm_town_general_modern"),
                         Map(name: ["綠色村莊巴路奧其", "村長chat", "巴路奧其0", "巴路奧其1", "巴路奧其2", "巴路奧其3", "巴路奧其4", "巴路奧其5"], music: "Bgm_town_baruoky"),
                         Map(name: ["王都悠尼岡", "悠尼岡0", "悠尼岡1", "悠尼岡2", "悠尼岡3", "悠尼岡4", "悠尼岡5"], music: "Bgm_town_unigan"),
                         Map(name: ["卡雷克濕原", "卡雷克濕原0", "卡雷克濕原1"], music: "Bgm_field_modern"),
                         Map(name: ["魔獸城", "魔獸城入口", "魔獸城0", "魔獸城1", "魔獸城2", "魔獸城3"], music: "Bgm_dungeon_beast_castle")]
    
    static let future = [Map(name: ["浮游街道涅瓦", "涅瓦0", "涅瓦1", "涅瓦2", "涅瓦3", "涅瓦4"], music: "Bgm_town_elgion"),
                         Map(name: ["傑諾領域", "庫羅諾斯chat", "圓香chat", "司政官chat", "傑諾領域0", "傑諾領域1", "傑諾領域2", "傑諾領域3", "傑諾領域4", "傑諾領域5"], music: "Bgm_dungeon_xeno_domain"),
                         Map(name: ["邊緣之島", "邊緣之島0", "邊緣之島1", "邊緣之島2", "邊緣之島3", "邊緣之島4", "邊緣之島5", "邊緣之島6", "邊緣之島7"], music: "Bgm_sad"),
                         Map(name: ["工業都市廢墟", "工業都市廢墟0", "工業都市廢墟1", "工業都市廢墟2", "工業都市廢墟3"], music: "Bgm_dungeon_general_maze"),
                         Map(name: ["廢棄公路99", "廢棄公路990", "廢棄公路991"], music: "Bgm_field_future"),
                         Map(name: ["曙光都市艾路茲恩", "薩奧chat", "小賽巴斯chat", "艾路茲恩0", "艾路茲恩1", "艾路茲恩2", "艾路茲恩3", "艾路茲恩4", "艾路茲恩5", "艾路茲恩6", "艾路茲恩7", "艾路茲恩8", "艾路茲恩9", "艾路茲恩10", "艾路茲恩11"], music: "Bgm_town_elgion"),
                         Map(name: ["艾路茲恩機場", "艾路茲恩機場0", "艾路茲恩機場1"], music: "Bgm_field_future"),
                         Map(name: ["次元戰艦", "次元戰艦0", "次元戰艦1", "次元戰艦2", "次元戰艦3", "次元戰艦4", "次元戰艦5"], music: "Bgm_storm"),
                         Map(name: ["琉萊巨蛋", "琉萊巨蛋0", "琉萊巨蛋1", "琉萊巨蛋2", "琉萊巨蛋3", "琉萊巨蛋4", "琉萊巨蛋5", "琉萊巨蛋6"], music: "Bgm_town_raula_dome")]
}
