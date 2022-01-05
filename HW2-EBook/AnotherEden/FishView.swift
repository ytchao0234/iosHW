//
//  FishView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI

struct FishView: View {
    @State private var show: Bool = false
    let fishCount = 126
    
    var body: some View {
        List {
            Section(header: Text("簡介")
                        .font(.custom("Yuppy TC Regular", size: 22))) {
                ScrollView(.horizontal, showsIndicators: false) {
                    let rows = [GridItem()]
                    LazyHGrid(rows: rows) {
                        ForEach(0 ..< 6) { count in
                            Image("釣魚\(count)")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
                .frame(height: UIScreen.main.bounds.height*0.15)
                .padding()
                
                Text("""
                     開始進行外傳「千年寶盒與海神神殿」後，就可以開始釣魚啦！
                     帶著從釣魚仙人那裡獲得的釣竿，探索各個地圖上的魚池吧！

                     無論是安全地圖或是危險地圖，都有機會找到魚池。
                     暫時離開戰鬥，慢下來享受釣魚的時光，慢慢提升釣魚成就與釣具等級。
                     在釣到越來越多的魚之後，說不定會有意想不到的成果哦！
                     """)
                    .font(.custom("Yuppy TC Regular", size: 18))
                    .padding()
            }
            
            Section(header: Text("釣魚圖鑑")
                        .font(.custom("Yuppy TC Regular", size: 22))) {
                let columns = [GridItem(.adaptive(minimum: 65))]
                
                LazyVGrid(columns: columns) {
                    ForEach(0 ..< fishCount) { count in
                        Image("fish\(count)")
                            .resizable()
                            .scaledToFit()
                    }
                }
                .padding()
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("釣魚")
                    .font(.custom("Yuppy TC Regular", size: 18))
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FishView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FishView()
        }
    }
}
