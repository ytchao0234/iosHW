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
            Text("簡介")
                .font(.title)
            VStack(alignment: .leading) {
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
                Text("...")
            }
            
            Text("釣魚圖鑑")
                .font(.title)
            ScrollView(.vertical) {
                let columns = Array(repeating: GridItem(), count: 4)
                
                LazyVGrid(columns: columns) {
                    ForEach(0 ..< fishCount) { count in
                        Image("fish\(count)")
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
        .padding()
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("釣魚")
            }
        })
    }
}

struct FishView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FishView()
        }
    }
}
