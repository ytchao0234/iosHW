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
            Text("簡介")
                .font(.title)
            VStack(alignment: .leading) {
                Text("...")
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
            }
            
            Text("貓咪冒險")
                .font(.title)
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    
                    VStack {
                        Image("法路奧")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .frame(height: UIScreen.main.bounds.height*0.1)
                        Text("法路奧")
                            .font(.caption2)
                    }
                    Spacer()
                }
                Text("...")
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
            }
            
            Text("貓咪圖鑑")
                .font(.title)
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
