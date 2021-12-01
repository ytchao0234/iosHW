//
//  FontFamilyPicker.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import SwiftUI

struct FontFamilyPicker: View {
    @StateObject var journalViewModel: JournalViewModel
    @Binding var currentFontFamily: String
    
    var body: some View {
        let fontFamily = Binding (
            get: { () -> Int in
                if let tag = journalViewModel.journals[journalViewModel.tag],
                   tag[journalViewModel.id] != nil
                {
                    return journalViewModel.journals[journalViewModel.tag]![journalViewModel.id]!.fontFamily
                }
                else {
                    return 0
                }
            },
            set: {
                if let tag = journalViewModel.journals[journalViewModel.tag],
                   tag[journalViewModel.id] != nil
                {
                    currentFontFamily = Journal.fontFamilyList[$0]
                    journalViewModel.journals[journalViewModel.tag]![journalViewModel.id]!.fontFamily = $0
                }
            }
        )
        
        return Picker(selection: fontFamily,
                      label: Text("字型")) {
            ForEach(Journal.fontFamilyList.indices) { index in
                Text(Journal.fontFamilyList[index])
                    .font(.custom(Journal.fontFamilyList[index], size: 20))
                    .tag(index)
            }
        }
    }
}
