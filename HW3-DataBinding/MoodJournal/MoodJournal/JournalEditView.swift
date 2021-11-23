//
//  JournalEditView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/24.
//

import SwiftUI

struct JournalEditView: View {
    @Binding var journalList: [Journal]
    let index: Int
    
    var body: some View {
        VStack {
            Text(journalList[index].title)
        }
        .onAppear {
            journalList[index].title = "!!!"
        }
    }
}

struct JournalEditView_Previews: PreviewProvider {
    @State static var journalList = [Journal.defaultJournal]
    
    static var previews: some View {
        JournalEditView(journalList: $journalList, index: 0)
    }
}
