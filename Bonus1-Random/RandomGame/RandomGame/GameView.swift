//
//  GameView.swift
//  RandomGame
//
//  Created by FanRende on 2021/10/27.
//

import SwiftUI

struct GameView: View {
    let elements = ["flame", "drop", "leaf", "cross"]
    let eleColors = [Color.red, Color.blue, Color.green, Color.yellow]

    var body: some View {
        var bossElement: Int = Int.random(in: 0 ..< 4)
        var playerElement: Int = Int.random(in: 0 ..< 4)
        
        return ZStack {
            Image("background")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
                .onAppear {
                    bossElement = Int.random(in: 0 ..< 4)
                }
            
            VStack(alignment: .center) {
                ZStack(alignment: .bottomTrailing) {
                    Image("devil2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                    Image(systemName: elements[bossElement] + ".circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .foregroundColor(eleColors[bossElement])
                }
                
                VStack {
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 200, height: 10)
                    Text("100/100")
                        .foregroundColor(.red)
                }
                
                Spacer()
                
                VStack {
                    Image(systemName: elements[playerElement] + ".circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .foregroundColor(eleColors[playerElement])
                    
                    Text(elements[playerElement])
                }
                
                Spacer()
                
                VStack {
                    VStack {
                        Text("100/100")
                            .foregroundColor(.red)
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(width: 200, height: 10)
                    }
                    Button{
                        playerElement = Int.random(in: 0 ..< 4)
                    } label: {
                        Text("ATTACK")
                            .font(.system(size: 28, design: .monospaced))
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GameView()
        }
    }
}
