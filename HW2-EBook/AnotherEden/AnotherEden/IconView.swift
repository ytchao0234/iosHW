//
//  IconView.swift
//  AnotherEden
//
//  Created by User08 on 2021/11/7.
//

import SwiftUI

struct IconView: View {
    let iconCount:Int = 8
    let iconName = [nil, "whiteCat", "orangeCat", "calicoCat", "siameseCat", "tortoiseshellCat", "machineCat", "americaCurlCat"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("launchColor"), Color("bgColor")]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
            VStack {
                ForEach(Array(stride(from: 0, to: 8, by: 2)), id: \.self) { count in
                    HStack {
                        Button(action: {
                            UIApplication.shared.setAlternateIconName(iconName[count])
                        }) {
                            Image("catIcon\(count)")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(30)
                        }
                        Button(action: {
                            UIApplication.shared.setAlternateIconName(iconName[count+1])
                        }) {
                            Image("catIcon\(count+1)")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(30)
                        }
                    }
                }
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("App Icon")
            }
        })
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            IconView()
        }
    }
}
