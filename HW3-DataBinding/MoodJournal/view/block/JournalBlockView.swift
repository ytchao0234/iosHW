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
        Journal.dateFormatter.dateFormat = "HH:mm:ss E, dd MMM yyyy"
        
        return ZStack(alignment: .topLeading) {
            VStack(alignment: .leading) {
                Text(journal.title)
                    .font(.title2)
                    .foregroundColor(.black)
                    .lineLimit(2)

                Spacer()

                Label(Journal.dateFormatter.string(from: journal.time), systemImage: "clock")
                    .font(.caption)
                    .foregroundColor(.black)
                Label(String(format: "(%.1f, %.1f)", journal.latitude, journal.longitude), systemImage: "location.circle")
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .padding(10)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 130, maxHeight: 130)
        .background(optionViewModel.background.color.brightness(-0.3))
        .cornerRadius(20)
    }
}

struct JournalBlockView_Previews: PreviewProvider {
    static var previews: some View {
        JournalBlockView(journal: Journal.test4,
                         optionViewModel: OptionViewModel())
    }
}
