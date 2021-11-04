//
//  CharacterView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI

struct CharacterView: View {
    let sections = ["主角", "邂逅", "外傳", "協奏", "特殊"]
    let sectionContents = [Character.main, Character.encounter, Character.anotherStory, Character.cooperate, Character.special]
    
    var body: some View {
        List {
            Text("在 Another Eden 裡，就算不用抽卡也能拿到非常多的角色。包含主角群、邂逅角、外傳角、協奏角以及一些特殊角色，都是在完成劇情任務後就會漸漸加入隊伍。其中邂逅角為特殊連續戰鬥任務獲得、外轉角為支線劇情任務獲得、協奏角為合作活動任務獲得。")
                .font(.caption)
                .padding()
                .background(Color.secondary.opacity(0.2))
                .cornerRadius(10)
            ForEach(0 ..< sections.count) { order in
                Section(header: Text(sections[order])) {
                    ForEach(sectionContents[order]) { character in
                        NavigationLink(
                            destination: CharacterDetailView(character: character),
                            label: {
                                CharacterRow(character: character)
                            })
                    }
                }
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("角色")
            }
        })
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CharacterView()
        }
    }
}

struct CharacterRow: View {
    var character: Character
    
    var body: some View {
        HStack {
            Image(character.name)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 50, height: 50)
                .scaleEffect(0.9)
                .overlay(Circle().stroke(Color.gray))
                .padding(.trailing)
            Text(character.name)
            Spacer()
        }
    }
}

struct Character: Identifiable {
    let id = UUID()
    
    let name: String
    let intro: String
}

extension Character {
    static let main = [Character(name: "阿爾德", intro: "主角"),
                       Character(name: "菲妮", intro: "主角"),
                       Character(name: "基爾德那", intro: "主角"),
                       Character(name: "阿露緹娜", intro: "主角"),
                       Character(name: "艾米", intro: "主角"),
                       Character(name: "莉卡", intro: "主角"),
                       Character(name: "嘉里德", intro: "主角"),
                       Character(name: "海蕾娜", intro: "主角"),
                       Character(name: "賽勒斯", intro: "主角"),]
    static let encounter = [Character(name: "阿佐美", intro: "邂逅角"),
                            Character(name: "伽琉", intro: "邂逅角"),
                            Character(name: "思琳", intro: "邂逅角"),
                            Character(name: "賈德", intro: "邂逅角"),]
    static let anotherStory = [Character(name: "蒂亞朵拉", intro: "外傳角"),
                               Character(name: "謝拉", intro: "外傳角"),
                               Character(name: "波波羅", intro: "外傳角"),
                               Character(name: "紗希", intro: "外傳角"),
                               Character(name: "瑪娜", intro: "外傳角"),
                               Character(name: "蘇菲婭", intro: "外傳角"),]
    static let cooperate = [Character(name: "JOKER", intro: "協奏角"),
                            Character(name: "摩爾加納", intro: "協奏角"),
                            Character(name: "SKULL", intro: "協奏角"),
                            Character(name: "VIOLET", intro: "協奏角"),
                            Character(name: "克雷斯", intro: "協奏角"),
                            Character(name: "蜜樂", intro: "協奏角"),
                            Character(name: "薇爾貝特", intro: "協奏角"),
                            Character(name: "由利", intro: "協奏角"),]
    static let special = [Character(name: "草人小子", intro: "特殊角"),
                          Character(name: "莉維雅", intro: "特殊角"),]
}
