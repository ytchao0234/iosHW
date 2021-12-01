//
//  TagPicker.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import SwiftUI

struct TagPicker: View {
    @StateObject var journalViewModel: JournalViewModel
    
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
            Toggle("新增標籤", isOn: $journalViewModel.toAddTag)

            if journalViewModel.toAddTag {
                TextField("標籤", text: $journalViewModel.newTag, prompt: Text("請輸入標籤"))
                    .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.secondary, lineWidth: 1))
            } else {
                Picker(selection: moodTag, label: Text("標籤")) {
                    ForEach(tagList.indices) { index in
                        Text(tagList[index]).tag(index)
                    }
                }
            }
        }
    }
}
