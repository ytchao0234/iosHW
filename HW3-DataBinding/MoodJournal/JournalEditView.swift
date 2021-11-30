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
    @State var fontFamily: String = ""
    @State var fontSize: CGFloat = 0
    @State var toAddTag = false
    @State var newTag = ""

    var body: some View {
        let tagList = journalDict.keys.sorted(by: sortTag)
        
        return GeometryReader { geometry in
            Form {
                fontFamilyPicker(
                    journalDict: $journalDict,
                    tag: tag, id: id,
                    currentFontFamily: $fontFamily
                )
                fontSizeStepper(
                    journalDict: $journalDict,
                    tag: tag, id: id,
                    currentFontSize: $fontSize
                )
                titleTextField(
                    journalDict: $journalDict,
                    tag: tag, id: id,
                    currentFontFamily: $fontFamily,
                    currentFontSize: $fontSize
                )
                contentTextEditor(
                    journalDict: $journalDict,
                    tag: tag, id: id,
                    currentFontFamily: $fontFamily,
                    currentFontSize: $fontSize,
                    geometryHeight: geometry.size.height
                )
                DisclosureGroup("其他") {
                    tagPicker(
                        journalDict: $journalDict,
                        tag: tag, id: id,
                        tagList: tagList,
                        toAddTag: $toAddTag,
                        newTag: $newTag
                    )
//                        地點
                }
            }
        }
        .onAppear {
            if let journalDictTag = journalDict[tag],
               let journal = journalDictTag[id]
            {
                self.fontFamily = Journal.fontFamilyList[journal.fontFamily]
                self.fontSize = journal.fontSize
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("編輯筆記")
            }
        })
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            if toAddTag && newTag != tag && newTag.count > 0,
               let journalDictTag = journalDict[tag],
               let journal = journalDictTag[id],
               !journal.isEmpty()
            {
                if journalDict[newTag] == nil {
                    journalDict[newTag] = [id: journal]
                } else {
                    journalDict[newTag]![id] = journal
                }
                
                journalDict[tag]!.removeValue(forKey: id)
                
                journalDict[newTag]![id]!.moodTag = journalDict.keys.sorted(by: sortTag).firstIndex(where: {$0 == newTag})!
            }

            Journal.saveJournalDict(records: journalDict)
        }
    }
}

struct JournalEditView_Previews: PreviewProvider {
    @State static var journalDict = Journal.defaultDict
    
    static var previews: some View {
        NavigationView {
            JournalEditView(journalDict: $journalDict, tag: "無標籤", id: Journal.test1.id)
        }
    }
}

struct fontFamilyPicker: View {
    @Binding var journalDict: [String: [UUID: Journal]]
    let tag: String
    let id: UUID
    @Binding var currentFontFamily: String
    
    var body: some View {
        let fontFamily = Binding (
            get: { () -> Int in
                if let journalDictTag = journalDict[tag],
                   let journal = journalDictTag[id]
                {
                    return journal.fontFamily
                }
                else {
                    return 0
                }
            },
            set: {
                if let journalDictTag = journalDict[tag],
                   let _ = journalDictTag[id]
                {
                    currentFontFamily = Journal.fontFamilyList[$0]
                    journalDict[tag]![id]!.fontFamily = $0
                }
            }
        )
        
        return Picker(selection: fontFamily,
                      label: Text("字型")) {
            ForEach(Journal.fontFamilyList.indices) { index in
                Text(Journal.fontFamilyList[index])
                    .font(.custom(Journal.fontFamilyList[index], size: 20))
                    .tag(index)
            }
        }
    }
}

struct fontSizeStepper: View {
    @Binding var journalDict: [String: [UUID: Journal]]
    let tag: String
    let id: UUID
    @Binding var currentFontSize: CGFloat
    
    var body: some View {
        let fontSize = Binding (
            get: { () -> CGFloat in
                if let journalDictTag = journalDict[tag],
                   let journal = journalDictTag[id]
                {
                    return journal.fontSize
                }
                else {
                    return 0
                }
            },
            set: {
                if let journalDictTag = journalDict[tag],
                   let _ = journalDictTag[id]
                {
                    currentFontSize = $0
                    journalDict[tag]![id]!.fontSize = $0
                }
            }
        )
        
        return Stepper("字體大小: \(Int(fontSize.wrappedValue))", value: fontSize, in: 10...40)
    }
}

struct titleTextField: View {
    @Binding var journalDict: [String: [UUID: Journal]]
    let tag: String
    let id: UUID
    @Binding var currentFontFamily: String
    @Binding var currentFontSize: CGFloat
    
    var body: some View {
        let title = Binding (
            get: { () -> String in
                if let journalDictTag = journalDict[tag],
                   let journal = journalDictTag[id]
                {
                    return journal.title
                }
                else {
                    return ""
                }
            },
            set: {
                if let journalDictTag = journalDict[tag],
                   let _ = journalDictTag[id]
                {
                    journalDict[tag]![id]!.title = $0
                }
            }
        )
        
        return TextField("標題", text: title,
                         prompt: Text("請輸入標題"))
            .font(.custom(currentFontFamily, size: currentFontSize))
            .padding(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.secondary, lineWidth: 1)
            )
    }
}

struct contentTextEditor: View {
    @Binding var journalDict: [String: [UUID: Journal]]
    let tag: String
    let id: UUID
    @Binding var currentFontFamily: String
    @Binding var currentFontSize: CGFloat
    let geometryHeight: CGFloat
    
    var body: some View {
        let content = Binding (
            get: { () -> String in
                if let journalDictTag = journalDict[tag],
                   let journal = journalDictTag[id]
                {
                    return journal.content
                }
                else {
                    return ""
                }
            },
            set: {
                if let journalDictTag = journalDict[tag],
                   let _ = journalDictTag[id]
                {
                    journalDict[tag]![id]!.content = $0
                }
            }
        )
        
        return TextEditor(text: content)
            .font(.custom(currentFontFamily, size: currentFontSize))
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.secondary, lineWidth: 1)
            )
            .frame(height: geometryHeight * 0.65)
    }
}

struct tagPicker: View {
    @Binding var journalDict: [String: [UUID: Journal]]
    let tag: String
    let id: UUID
    let tagList: [String]
    @Binding var toAddTag: Bool
    @Binding var newTag: String
    
    var body: some View {
        let moodTag = Binding (
            get: { () -> Int in
                if let journalDictTag = journalDict[tag],
                   let journal = journalDictTag[id]
                {
                    return journal.moodTag
                }
                else {
                    return 0
                }
            },
            set: {
                if let journalDictTag = journalDict[tag],
                   let _ = journalDictTag[id]
                {
                    journalDict[tag]![id]!.moodTag = $0
                }
            }
        )
        
        return Group {
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
        }
    }
}
