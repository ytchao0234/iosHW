//
//  CatView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI

struct CatView: View {
    @State private var show: Bool = false
    let ancientCatCount = 20
    let modernCatCount = 41
    let futureCatCount = 56
    
    var body: some View {
        let rows = [GridItem()]
        
        List {
            Section(header: Text("簡介")
                        .font(.custom("Yuppy TC Regular", size: 22))) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows) {
                        ForEach(0 ..< 5) { count in
                            Image("路遇貓\(count)")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
                .frame(height: UIScreen.main.bounds.height*0.15)
                .padding()

                Text("""
                     無論是什麼時代，安全地圖或是危險地圖，都有機會看見貓咪的出沒唷！
                     冒險的同時多多注意路邊的貓咪，就可以獲得成就獎勵，
                     遇到喜歡的貓咪，也可以讓牠加入你的隊伍，和你一起穿越時空、展開冒險！
                     甚至還有機會在任務過程中成為你的小幫手！
                     """)
                    .font(.custom("Yuppy TC Regular", size: 18))
                    .padding()
            }
            
            Section(header: Text("貓咪冒險")
                        .font(.custom("Yuppy TC Regular", size: 22))) {
                HStack {
                    Spacer()
                    
                    VStack {
                        Image("法路奧")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .frame(height: UIScreen.main.bounds.height*0.1)
                        Text("法路奧")
                            .font(.custom("Yuppy TC Regular", size: 12))
                    }
                    Spacer()
                }
                .padding(.top)
                
                Text("""
                     完成主線劇情第一部後，就可以進行貓咪冒險啦！
                     以阿爾德家的貓咪「法路奧」的視角，探索貓咪才能發現的事物。
                     法路奧與 NPC 對話時，會出現與原本不同的回覆與小劇情，
                     也有機會進行貓咪任務唷！

                     地圖上會出現貓咪才能發現的掉落物，作為素材可以換取貓咪裝備，
                     讓你的貓咪變得與眾不同！
                     也可以獵捕危險地圖上的小獵物，和附近的貓咪們換取素材。

                     在探索地圖的過程中，有可能進入貓咪才能發現的隱藏通道，
                     讓貓咪帶領你走進通道，獲得豐厚獎勵吧！
                     """)
                    .font(.custom("Yuppy TC Regular", size: 18))
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: rows) {
                        ForEach(0 ..< 5) { count in
                            Image("貓冒險\(count)")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
                .frame(height: UIScreen.main.bounds.height*0.15)
                .padding()
            }
            
            Section(header: Text("貓咪圖鑑")
                        .font(.custom("Yuppy TC Regular", size: 22))) {
                let columns = [GridItem(.adaptive(minimum: 80))]
                    
                Section(header:
                    HStack{
                        Spacer()
                        Text("古代")
                            .font(.custom("Yuppy TC Regular", size: 18))
                        Spacer()
                }) {
                    LazyVGrid(columns: columns) {
                        ForEach(0 ..< ancientCatCount) { count in
                            Image("cat\(count)")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .padding()
                }
                    
                Section(header:
                    HStack{
                        Spacer()
                        Text("現代")
                            .font(.custom("Yuppy TC Regular", size: 18))
                        Spacer()
                }) {
                    LazyVGrid(columns: columns) {
                        Image("法路奧")
                            .resizable()
                            .scaledToFit()
                        ForEach(ancientCatCount ..< modernCatCount) { count in
                            Image("cat\(count)")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .padding()
                }
                    
                Section(header:
                    HStack{
                        Spacer()
                        Text("未來")
                            .font(.custom("Yuppy TC Regular", size: 18))
                        Spacer()
                }) {
                    LazyVGrid(columns: columns) {
                        ForEach(modernCatCount ..< futureCatCount) { count in
                            Image("cat\(count)")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .padding()
                }
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("貓咪")
                    .font(.custom("Yuppy TC Regular", size: 18))
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CatView()
        }
    }
}
