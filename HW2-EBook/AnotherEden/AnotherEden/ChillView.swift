//
//  ChillView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI

struct ChillView: View {
    var body: some View {
        VStack {
            NavigationLink(
                destination: CatView(),
                label: {
                    Text("貓咪")
                        .font(.title)
                        .padding()
                })
            NavigationLink(
                destination: FishView(),
                label: {
                    Text("釣魚")
                        .font(.title)
                        .padding()
                })
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("休閒")
            }
        })
    }
}

struct ChillView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChillView()
        }
    }
}
