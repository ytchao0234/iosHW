//
//  CatView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI

struct CatView: View {
    let ancientCatCount = 20
    let modernCatCount = 42
    let futureCatCount = 57
    
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
                let columns = Array(repeating: GridItem(), count: 3)
                
                Section(header: Text("古代")) {
                    LazyVGrid(columns: columns) {
                        ForEach(0 ..< ancientCatCount) { count in
                            Image("cat\(count)")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
                
                Section(header: Text("現代")) {
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
                }
                
                Section(header: Text("未來")) {
                    LazyVGrid(columns: columns) {
                        ForEach(modernCatCount ..< futureCatCount) { count in
                            Image("cat\(count)")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
            }
        }
        .padding()
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("貓咪")
            }
        })
    }
}

struct CatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CatView()
        }
    }
}
