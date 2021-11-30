//
//  readAndEditNavLinks.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/26.
//

import SwiftUI

struct readAndEditNavLinks: View {
    @Binding var journalDict: [String: [UUID: Journal]]
    @Binding var journalTag: String?
    @Binding var journalID: UUID?
    @Binding var toRead: Bool
    @Binding var toEdit: Bool
    
    var body: some View {
        ZStack {
            if let tag = self.journalTag,
               let id = self.journalID,
               let journalDictTag = journalDict[tag],
               let journal = journalDictTag[id]
            {
                NavigationLink(
                    destination: JournalReadView(journal: journal),
                    isActive: $toRead,
                    label: {
                        EmptyView()
                })
                NavigationLink(
                    destination: JournalEditView(journalDict: $journalDict, tag: tag, id: id),
                    isActive: $toEdit,
                    label: {
                        EmptyView()
                })
            }
        }
    }
}

struct readAndEditNavLinks_Previews: PreviewProvider {
    @State static var journalDict: [String: [UUID: Journal]] = Journal.defaultDict
    @State static var toRead = false
    @State static var toEdit = false
    @State static var journalID: UUID?
    @State static var journalTag: String?
    
    static var previews: some View {
        readAndEditNavLinks(
            journalDict: $journalDict,
            journalTag: $journalTag,
            journalID: $journalID,
            toRead: $toRead,
            toEdit: $toEdit
        )
    }
}
