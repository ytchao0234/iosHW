//
//  FishView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI

struct FishView: View {
    let fishCount = 126
    var body: some View {
        List {
            Text("簡介")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0 ..< 5) { count in
                        Image("路遇貓\(count)")
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
            .frame(height: 150)
            
            Text("簡介")
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
        FishView()
    }
}
