//
//  GameView.swift
//  RandomGame
//
//  Created by FanRende on 2021/10/27.
//

import SwiftUI

struct GameView: View {
    @State var atkResult: AttackResult
    let elements = ["flame", "drop", "leaf", "cross"]
    let types = ["火焰", "流水", "草木", "治療"]
    let eleColors = [Color.red, Color.blue, Color.green, Color.yellow]

    var body: some View {
        return ZStack {
            Image("background")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
                .onAppear {
                    atkResult.bossType = Int.random(in: 0 ..< 3)
                }
            
            VStack(alignment: .center) {
                ZStack(alignment: .bottomTrailing) {
                    Image("devil2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                    Image(systemName: elements[atkResult.bossType] + ".circle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .foregroundColor(eleColors[atkResult.bossType])
                }
                
                VStack {
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: CGFloat(atkResult.bossHP * 2), height: 10)
                    Text("\(atkResult.bossHP)/\(AttackResult.maxHP)")
                        .foregroundColor(.red)
                }
                
                Spacer()
                
                VStack {
                    if atkResult.message != AttackResult.defaultResult.message {
                        Image(systemName: elements[atkResult.attackType] + ".circle")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .foregroundColor(eleColors[atkResult.attackType])
                        
                        Text(atkResult.message)
                            .fontWeight(.bold)
                            .padding()
                            .background(eleColors[atkResult.attackType])
                            .cornerRadius(10)
                            .padding()
                    }
                    else {
                        Text(atkResult.message)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.secondary)
                            .cornerRadius(10)
                            .padding()
                        
                    }
                }
                
                Spacer()
                
                VStack {
                    if atkResult.bossHP > 0 {
                        Button {
                            atkResult = attack(last: atkResult, types: types)
                            
                            if atkResult.bossHP == 0 {
                                atkResult.message += "\n\n遊戲勝利，請重新開始"
                            }
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
                    else {
                        Button {
                        } label: {
                            Text("ATTACK")
                                .font(.system(size: 28, design: .monospaced))
                                .fontWeight(.bold)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                        .hidden()
                    }
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GameView(atkResult: .defaultResult)
        }
    }
}

func attack(last: AttackResult, types: [String]) -> AttackResult {
    var result = last
    result.attackType = Int.random(in: 0 ..< 4)
    
    let baseAmount = 10
    let healing = (result.attackType == 3) ? true : false
    
    if healing {
        result.bossHP = (result.bossHP + baseAmount * 3) < AttackResult.maxHP ? result.bossHP + baseAmount * 3 : AttackResult.maxHP
        result.message = "攻擊屬性為『\(types[result.attackType])』，治癒 BOSS \(baseAmount * 3) 點"
    }
    else {
        if result.bossType == result.attackType {
            result.bossHP = (result.bossHP - baseAmount) > 0 ? result.bossHP - baseAmount : 0
            result.message = "攻擊屬性為『\(types[result.attackType])』，與 BOSS 屬性相同，攻擊 BOSS \(baseAmount) 點"
        }
        else if result.bossType == (result.attackType + 1) % 3 {
            result.bossHP = (result.bossHP - baseAmount / 2) > 0 ? result.bossHP - baseAmount / 2 : 0
            result.message = "攻擊屬性為『\(types[result.attackType])』，受 BOSS 屬性克制，攻擊 BOSS \(baseAmount / 2) 點"
        }
        else {
            result.bossHP = (result.bossHP - baseAmount * 2) > 0 ? result.bossHP - baseAmount * 2 : 0
            result.message = "攻擊屬性為『\(types[result.attackType])』，克制 BOSS 屬性，攻擊 BOSS \(baseAmount * 2) 點"
        }
    }
    
    return result
}
