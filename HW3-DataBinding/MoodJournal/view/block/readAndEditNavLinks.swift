//
//  readAndEditNavLinks.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/26.
//

import SwiftUI

struct readAndEditNavLinks: View {
    @StateObject var journalViewModel: JournalViewModel
    @StateObject var optionViewModel: OptionViewModel

    var body: some View {
        ZStack {
            if let tag = journalViewModel.journals[journalViewModel.tag],
               let journal = tag[journalViewModel.id]
            {
                NavigationLink(
                    destination: JournalReadView(
                        journal: journal,
                        optionViewModel: optionViewModel
                    ),
                    isActive: $journalViewModel.toRead,
                    label: {
                        EmptyView()
                })
                NavigationLink(
                    destination: JournalEditView(
                        journalViewModel: journalViewModel,
                        optionViewModel: optionViewModel
                    ),
                    isActive: $journalViewModel.toEdit,
                    label: {
                        EmptyView()
                })
            }
        }
    }
}

struct readAndEditNavLinks_Previews: PreviewProvider {
    static var previews: some View {
        readAndEditNavLinks(
            journalViewModel: JournalViewModel(),
            optionViewModel: OptionViewModel()
        )
    }
}
