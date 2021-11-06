//
//  StoryView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI

struct StoryView: View {
    @State private var showIntro: Bool = false
    @State private var selection: Story = Story.defaultStory
    
    var body: some View {
        List {
            ScrollView(.vertical) {
                Section(header: Text("主線")) {
                    StoryBlock(showIntro: $showIntro, selection: $selection, story: Story.defaultStory)
                }
                
                Section(header: Text("外傳")) {
                    VStack {
//                        ForEach(0 ..< 1) { count in
//                        }
                        StoryBlock(showIntro: $showIntro, selection: $selection, story: Story.defaultStory1)
                        StoryBlock(showIntro: $showIntro, selection: $selection, story: Story.defaultStory2)
                        StoryBlock(showIntro: $showIntro, selection: $selection, story: Story.defaultStory1)
                        StoryBlock(showIntro: $showIntro, selection: $selection, story: Story.defaultStory2)
                    }
                }
            }
        }
        .padding()
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("劇情")
            }
        })
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}

struct StoryBlock: View {
    @Binding var showIntro: Bool
    @Binding var selection: Story
    var story: Story
    
    var body: some View {
        Button(action: {
            if selection.id == story.id {
                if showIntro {
                    showIntro = false
                } else {
                    showIntro = true
                }
            }
            
            selection = story
        }, label: {
            Image(story.name)
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
        })
        
        if showIntro && selection.id == story.id {
            Text(story.intro)
        }
    }
}

struct Story: Identifiable {
    let id = UUID()
    
    let name: String
    let character: String
    let intro: String
}

extension Story {
    static let defaultStory = Story(name: "阿爾德", character: "可獲得角色: 阿爾德、菲妮、艾米、嘉爾德、海蕾娜、賽勒斯、基爾德那、阿露緹娜", intro: "主線")
    static let defaultStory1 = Story(name: "菲妮", character: "可獲得角色: 阿爾德、菲妮、艾米、嘉爾德、海蕾娜、賽勒斯、基爾德那、阿露緹娜", intro: "外傳")
    static let defaultStory2 = Story(name: "艾米", character: "可獲得角色: 阿爾德、菲妮、艾米、嘉爾德、海蕾娜、賽勒斯、基爾德那、阿露緹娜", intro: "外傳")
}
