//
//  JournalBlockButton.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/26.
//

import SwiftUI

struct JournalBlockButton: View {
    @Binding var journalDict: [String: [UUID: Journal]]
    @Binding var journalTag: String?
    @Binding var journalID: UUID?
    @Binding var toRead: Bool
    @Binding var toEdit: Bool
    let tag: String
    let journal: Journal
    
    var body: some View {
        Button(action: {
            toRead = true
            journalTag = tag
            journalID = journal.id
        }, label: {
            JournalBlockView(journal: journal)
        })
        .contextMenu {
            JournalReadButton(
                toRead: $toRead,
                journalTag: $journalTag,
                journalID: $journalID,
                tag: tag,
                journal: journal
            )
            JournalEditButton(
                toEdit: $toEdit,
                journalTag: $journalTag,
                journalID: $journalID,
                tag: tag,
                journal: journal
            )
            JournalDeleteButton(
                journalDict: $journalDict,
                tag: tag,
                journal: journal
            )
        }
    }
}

struct JournalBlockButton_Previews: PreviewProvider {
    @State static var journalDict: [String: [UUID: Journal]] = Journal.defaultDict
    @State static var toRead = false
    @State static var toEdit = false
    @State static var journalID: UUID?
    @State static var journalTag: String?
    static var tag = "無標籤"
    static var journal = Journal.test1
    
    static var previews: some View {
        JournalBlockButton(
            journalDict: $journalDict,
            journalTag: $journalTag,
            journalID: $journalID,
            toRead: $toRead,
            toEdit: $toEdit,
            tag: tag,
            journal: journal
        )
    }
}

struct JournalReadButton: View {
    @Binding var toRead: Bool
    @Binding var journalTag: String?
    @Binding var journalID: UUID?
    let tag: String
    let journal: Journal
    
    var body: some View {
        Button(action: {
            self.toRead = true
            self.journalTag = tag
            self.journalID = journal.id
        }, label: {
            Label("閱讀筆記", systemImage: "doc.text.magnifyingglass")
        })
    }
}

struct JournalEditButton: View {
    @Binding var toEdit: Bool
    @Binding var journalTag: String?
    @Binding var journalID: UUID?
    let tag: String
    let journal: Journal
    
    var body: some View {
        Button(action: {
            self.toEdit = true
            self.journalTag = tag
            self.journalID = journal.id
        }, label: {
            Label("編輯筆記", systemImage: "square.and.pencil")
        })
    }
}

struct JournalDeleteButton: View {
    @Binding var journalDict: [String: [UUID: Journal]]
    let tag: String
    let journal: Journal
    
    var body: some View {
        Button(role: .destructive, action: {
            self.journalDict[tag]!.removeValue(forKey: journal.id)
            
            if NSDictionary(dictionary: self.journalDict[tag]!).isEqual(to: [:]) {
                self.journalDict.removeValue(forKey: tag)
            }
            
            Journal.saveJournalDict(records: journalDict)
        }, label: {
            Label("刪除筆記", systemImage: "trash")
        })
    }
}
