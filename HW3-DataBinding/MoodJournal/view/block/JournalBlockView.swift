//
//  JournalBlockView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/23.
//

import SwiftUI

struct JournalBlockView: View {
    let journal: Journal
    @StateObject var optionViewModel: OptionViewModel

    var body: some View {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss E, dd MMM yyyy"
        
        return ZStack(alignment: .topLeading) {
            VStack(alignment: .leading) {
                Text(journal.title)
                    .font(.title2)
                    .foregroundColor(.black)
                    .lineLimit(2)

                Spacer()

                Label(dateFormatter.string(from: journal.time), systemImage: "clock")
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .padding(10)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 120, maxHeight: 120)
        .background(optionViewModel.background.color.brightness(-0.12))
        .cornerRadius(20)
    }
}

struct JournalBlockView_Previews: PreviewProvider {
    static var previews: some View {
        JournalBlockView(journal: Journal.emptyJournal,
                         optionViewModel: OptionViewModel())
    }
}
