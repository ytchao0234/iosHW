//
//  JournalEditView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/24.
//

import SwiftUI

struct JournalEditView: View {
    @Binding var journalDict: [String: [UUID: Journal]]
    let tag: String
    let id: UUID
    @State var journal = Journal.emptyJournal
    @State var toAddTag = false
    @State var newTag = ""

    var body: some View {
        let tagList = journalDict.keys.sorted(by: sortTag)

        let title = Binding (
            get: { journal.title },
            set: { journal.title = $0 }
        )
        let content = Binding (
            get: { journal.content },
            set: { journal.content = $0 }
        )
        let fontSize = Binding (
            get: { journal.fontSize },
            set: { journal.fontSize = $0 }
        )
        let fontFamily = Binding (
            get: { journal.fontFamily },
            set: { journal.fontFamily = $0; print($0) }
        )
        let moodTag = Binding (
            get: { journal.moodTag },
            set: { journal.moodTag = $0 }
        )
        
        return GeometryReader { geometry in
            Form {
                Picker(selection: fontFamily, label: Text("字型")) {
                    ForEach(Journal.fontFamilyList.indices) { index in
                        Text(Journal.fontFamilyList[index]).tag(index)
                    }
                }
                Stepper("字體大小: \(journal.fontSize)", value: fontSize, in: 10...40)

                TextField("標題", text: title, prompt: Text("請輸入標題"))
                    .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.secondary, lineWidth: 1))

                TextEditor(text: content)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.secondary, lineWidth: 1))
                    .frame(height: geometry.size.height * 0.65)
                DisclosureGroup("其他") {
                    Toggle("新增標籤", isOn: $toAddTag)

                    if toAddTag {
                        TextField("標籤", text: $newTag, prompt: Text("請輸入標籤"))
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
//                        地點
                }
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("編輯筆記")
                    .font(.custom("Yuppy TC Regular", size: 18))
            }
        })
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            self.journal = journalDict[tag]![id]!
        }
        .onDisappear {
            if journal.isEmpty()  {
                journalDict[tag]!.removeValue(forKey: id)

                if NSDictionary(dictionary: journalDict[tag]!).isEqual(to: [:]) {
                    journalDict.removeValue(forKey: tag)
                }
            }
            else {
                if toAddTag {
                    journalDict[newTag] = [id: self.journal]
                    journalDict[tag]!.removeValue(forKey: id)
                    self.journal.moodTag = journalDict.keys.sorted().firstIndex(where: {$0 == newTag})!
                }
                else {
                    journalDict[tag]![id]! = self.journal
                }
            }

            Journal.saveJournalDict(records: journalDict)
        }
    }
}

struct JournalEditView_Previews: PreviewProvider {
    @State static var journalDict = Journal.defaultDict
    
    static var previews: some View {
        NavigationView {
            JournalEditView(journalDict: $journalDict, tag: journalDict.keys.first!, id: journalDict.first!.value.first!.value.id)
        }
    }
}
