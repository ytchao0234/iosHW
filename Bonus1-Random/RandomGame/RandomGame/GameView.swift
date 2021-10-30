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
    let healingTarget = ["BOSS", "自身", "雙方"]
    let eleColors = [Color.red, Color.blue, Color.green, Color.yellow]

    var body: some View {
        return ZStack {
            Image("background")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
            
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
                .animation(.easeInOut(duration: 0.3), value: atkResult.bossHP)
                
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
                .animation(.easeInOut(duration: 0.5), value: atkResult.message)
                
                Spacer()
                
                VStack {
                    Text("\(atkResult.playerHP)/\(AttackResult.maxHP)")
                        .foregroundColor(.red)
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: CGFloat(atkResult.playerHP * 2), height: 10)
                }
                .animation(.easeInOut(duration: 0.3), value: atkResult.playerHP)
                
                VStack {
                    if atkResult.bossHP > 0 && atkResult.playerHP > 0 {
                        Button {
                            atkResult = attack(last: atkResult, types: types, targets: healingTarget)
                            
                            if atkResult.bossHP == 0 && atkResult.playerHP == 0 {
                                atkResult.message += "\n\n遊戲平手，請重新開始"
                            }
                            else if atkResult.bossHP == 0 {
                                atkResult.message += "\n\n遊戲勝利，請重新開始"
                            }
                            else if atkResult.playerHP == 0 {
                                atkResult.message += "\n\n遊戲失敗，請重新開始"
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
        .onAppear {
            atkResult.bossType = Int.random(in: 0 ..< 3)
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

func attack(last: AttackResult, types: [String], targets: [String]) -> AttackResult {
    var result = last
    result.attackType = Int.random(in: 0 ..< 4)
    result.dodge = Float.random(in: 0 ..< 1) < 0.35 ? true : false
    result.criticalStrike = Float.random(in: 0 ..< 1) < 0.35 ? true : false
    
    let baseAmount = 10
    let healing = (result.attackType == 3) ? true : false
    let target = Int.random(in: 0 ..< 3)
    let healingAmount = (result.criticalStrike) ? baseAmount * 4 : baseAmount * 2
    var hpLoss = 0
    var damage = 0
    
    if healing {
        if target == 0 || target == 2 {
            result.bossHP = (result.bossHP + baseAmount * 2) < AttackResult.maxHP ? result.bossHP + baseAmount * 2 : AttackResult.maxHP
        }
        if target == 1 || target == 2 {
            result.playerHP = (result.playerHP + baseAmount * 2) < AttackResult.maxHP ? result.playerHP + baseAmount * 2 : AttackResult.maxHP
        }
        result.message = "攻擊屬性為『\(types[result.attackType])』，將隨機選擇治癒\(targets[0])、治癒\(targets[1])或治癒\(targets[2])\n\n本次選擇結果為治癒\(targets[target])\(result.criticalStrike ? "，本次攻擊暴擊，治癒" : "") \(healingAmount) 點"
    }
    else {
        if result.bossType == result.attackType {
            hpLoss = (result.dodge) ? 0 : baseAmount
            damage = (result.criticalStrike) ? baseAmount * 2 : baseAmount
            
            result.message = "攻擊屬性為『\(types[result.attackType])』，與 BOSS 屬性相同\n"
            result.message += "\(result.criticalStrike ? "本次攻擊暴擊，" : "")攻擊 BOSS \(damage) 點\n"
            result.message += "\(result.dodge ? "成功閃避攻擊，" : "")受 BOSS 攻擊 \(hpLoss) 點"
        }
        else if result.bossType == (result.attackType + 1) % 3 {
            hpLoss = (result.dodge) ? 0 : baseAmount * 2
            damage = (result.criticalStrike) ? baseAmount : baseAmount / 2
            
            result.message = "攻擊屬性為『\(types[result.attackType])』，受 BOSS 屬性克制\n"
            result.message += "\(result.criticalStrike ? "本次攻擊暴擊，" : "")攻擊 BOSS \(damage) 點\n"
            result.message += "\(result.dodge ? "成功閃避攻擊，" : "")受 BOSS 攻擊 \(hpLoss) 點"
        }
        else {
            hpLoss = (result.dodge) ? 0 : baseAmount / 2
            damage = (result.criticalStrike) ? baseAmount * 4 : baseAmount * 2
            
            result.message = "攻擊屬性為『\(types[result.attackType])』，克制 BOSS 屬性\n"
            result.message += "\(result.criticalStrike ? "本次攻擊暴擊，" : "")攻擊 BOSS \(damage) 點\n"
            result.message += "\(result.dodge ? "成功閃避攻擊，" : "")受 BOSS 攻擊 \(hpLoss) 點"
        }
        
        result.playerHP = (result.playerHP - hpLoss) > 0 ? result.playerHP - hpLoss : 0
        result.bossHP = (result.bossHP - damage) > 0 ? result.bossHP - damage : 0
    }
    
    return result
}
