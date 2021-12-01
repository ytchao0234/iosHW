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
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                Text(journal.title)
                    .font(.custom(Journal.fontFamilyList[journal.fontFamily], size: journal.fontSize + 6))
                    .fontWeight(.heavy)
                    .padding(.bottom)
                Text(journal.content)
                    .font(.custom(Journal.fontFamilyList[journal.fontFamily], size: journal.fontSize))
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width, alignment: .topLeading)
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text(journal.title)
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct JournalReadView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JournalReadView(journal: Journal.test1)
        }
    }
}
