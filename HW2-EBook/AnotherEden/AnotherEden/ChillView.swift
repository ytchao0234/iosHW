//
//  ChillView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI

struct ChillView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: CatView(),
                    label: {
                        Image("cat")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(30)
                            .padding(.horizontal)
                    })
                NavigationLink(
                    destination: FishView(),
                    label: {
                        Image("fish")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(30)
                            .padding(.horizontal)
                    })
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("休閒")
                }
            })
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color("launchColor"), Color("bgColor")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1)))
            .ignoresSafeArea()
        }
    }
}

struct ChillView_Previews: PreviewProvider {
    static var previews: some View {
        ChillView()
    }
}
