//
//  JournalEditView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/24.
//

import SwiftUI

struct JournalEditView: View {
    @Binding var journalDict: [UUID: Journal]
    let id: UUID
    
    var body: some View {
        VStack {
            Text(journalDict[id]!.title)
        }
        .onAppear {
            journalDict[id]!.title = "!!!"
        }
        .onDisappear {
            Journal.saveJournalDict(records: journalDict)
        }
    }
}

struct JournalEditView_Previews: PreviewProvider {
    @State static var journalDict = Journal.defaultDict
    
    static var previews: some View {
        JournalEditView(journalDict: $journalDict, id: journalDict.first!.value.id)
    }
}
