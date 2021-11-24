//
//  JournalReadView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/24.
//

import SwiftUI

struct JournalReadView: View {
    let journal: Journal
    
    var body: some View {
        Text(journal.title)
    }
}

struct JournalReadView_Previews: PreviewProvider {
    static var previews: some View {
        JournalReadView(journal: Journal.defaultJournal)
    }
}
