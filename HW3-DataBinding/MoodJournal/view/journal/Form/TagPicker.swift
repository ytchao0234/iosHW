//
//  TagPicker.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import SwiftUI

struct TagPicker: View {
    @StateObject var journalViewModel: JournalViewModel
    @StateObject var optionViewModel: OptionViewModel
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
        let moodTag = Binding (
            get: { () -> Int in
                if let tag = journalViewModel.journals[journalViewModel.tag],
                   tag[journalViewModel.id] != nil
                {
                    return journalViewModel.journals[journalViewModel.tag]![journalViewModel.id]!.moodTag
                }
                else {
                    return 0
                }
            },
            set: {
                if let tag = journalViewModel.journals[journalViewModel.tag],
                   tag[journalViewModel.id] != nil
                {
                    journalViewModel.journals[journalViewModel.tag]![journalViewModel.id]!.moodTag = $0
                }
            }
        )
        
        let tagList = journalViewModel.journals.keys.sorted(by: journalViewModel.sortTag)
        
        return Group {
            Toggle(isOn: $journalViewModel.toAddTag) {
                Text("新增標籤")
                    .modifier(FormFactorModifier(color: optionViewModel.background.color))
            }

            if journalViewModel.toAddTag {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(optionViewModel.background.color, lineWidth: 5)
                        .background(optionViewModel.background.color.brightness(-0.4))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.secondary, lineWidth: 0.5)
                        )
                    
                    if journalViewModel.newTag.isEmpty {
                        Text("請輸入標籤...")
                            .foregroundColor(optionViewModel.background.color)
                            .opacity(0.5)
                            .padding(5)
                    }
                        
                    TextField("", text: $journalViewModel.newTag)
                        .foregroundColor(optionViewModel.background.color)
                        .padding(5)
                        .focused($isFocused)
                        .onTapGesture {
                            isFocused = false
                        }
                }
            } else {
                Picker(selection: moodTag, label:
                        Text("標籤")
                            .modifier(FormFactorModifier(color: optionViewModel.background.color))
                ) {
                    ForEach(tagList.indices) { index in
                        Text(tagList[index]).tag(index)
                    }
                }
            }
        }
    }
}
