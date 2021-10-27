//
//  ContentView.swift
//  RandomGame
//
//  Created by FanRende on 2021/10/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .ignoresSafeArea()
                VStack {
                    Image("隨機")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                    Image("大魔王")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                    Image("devil")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                    
                    Spacer()
                    
                    NavigationLink {
                        GameView()
                    } label: {
                        Text("START!")
                            .font(.system(size: 28, design: .monospaced))
                            .fontWeight(.bold)
                            .foregroundColor(.yellow)
                            .padding()
                            .background(Color.purple)
                            .cornerRadius(10.0)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
