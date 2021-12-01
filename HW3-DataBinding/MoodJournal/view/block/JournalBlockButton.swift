//
//  JournalBlockButton.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/26.
//

import SwiftUI

struct JournalBlockButton: View {
    @StateObject var journalViewModel: JournalViewModel
    let tag: String
    let journal: Journal
    
    var body: some View {
        Button(action: {
            journalViewModel.toRead = true
            journalViewModel.tag = tag
            journalViewModel.id = journal.id
        }, label: {
            JournalBlockView(journal: journal)
        })
        .contextMenu {
            Button(action: {
                journalViewModel.toRead = true
                journalViewModel.tag = tag
                journalViewModel.id = journal.id
            }, label: {
                Label("閱讀筆記", systemImage: "doc.text.magnifyingglass")
            })
            Button(action: {
                journalViewModel.toEdit = true
                journalViewModel.tag = tag
                journalViewModel.id = journal.id
                journalViewModel.toAddTag = false
            }, label: {
                Label("編輯筆記", systemImage: "square.and.pencil")
            })
            Button(role: .destructive, action: {
                journalViewModel.tag = tag
                journalViewModel.id = journal.id
                journalViewModel.deleteJournal()
                journalViewModel.saveJournals()
            }, label: {
                Label("刪除筆記", systemImage: "trash")
            })
        }
    }
}

struct JournalBlockButton_Previews: PreviewProvider {
    static var previews: some View {
        JournalBlockButton(
            journalViewModel: JournalViewModel(),
            tag: "無標籤",
            journal: Journal.test1
        )
    }
}
