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
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("launchColor"), Color("bgColor")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .ignoresSafeArea()
                VStack {
                    Section(header:
                        Text("貓咪")
                            .font(.custom("Yuppy TC Regular", size: 14))
                            .padding(.vertical, 3)
                            .frame(minWidth:0, maxWidth: .infinity)
                            .background(Color.gray)
                            .cornerRadius(10)
                    ) {
                        NavigationLink(
                            destination: CatView(),
                            label: {
                                Image("cat")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(30)
                            })
                    }
                    
                    Section(header:
                        Text("釣魚")
                            .font(.custom("Yuppy TC Regular", size: 14))
                            .padding(.vertical, 3)
                            .frame(minWidth:0, maxWidth: .infinity)
                            .background(Color.gray)
                            .cornerRadius(10)
                    ) {
                        NavigationLink(
                            destination: FishView(),
                            label: {
                                Image("fish")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(30)
                            })
                    }
                }
                .padding()
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("休閒")
                        .font(.custom("Yuppy TC Regular", size: 18))
                }
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ChillView_Previews: PreviewProvider {
    static var previews: some View {
        ChillView()
    }
}
