//
//  AttackResult.swift
//  RandomGame
//
//  Created by FanRende on 2021/10/29.
//

import Foundation

struct AttackResult {
    var bossType: Int
    var attackType: Int
    var bossHP: Int
    var playerHP: Int
    var message: String
    
    var dodge: Bool
    var criticalStrike: Bool
}

extension AttackResult {
    static let maxHP: Int = 100
    static let defaultResult = AttackResult(bossType: Int.random(in: 0 ..< 3), attackType: Int.random(in: 0 ..< 4), bossHP: AttackResult.maxHP, playerHP: AttackResult.maxHP, message: "遊戲開始，請點擊 ATTACK 按鈕", dodge: false, criticalStrike: false)
}
