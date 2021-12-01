//
//  FontSizeStepper.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import SwiftUI

struct FontSizeStepper: View {
    @StateObject var journalViewModel: JournalViewModel
    @Binding var currentFontSize: CGFloat
    
    var body: some View {
        let fontSize = Binding (
            get: { () -> CGFloat in
                if let tag = journalViewModel.journals[journalViewModel.tag],
                   tag[journalViewModel.id] != nil
                {
                    return journalViewModel.journals[journalViewModel.tag]![journalViewModel.id]!.fontSize
                }
                else {
                    return 0
                }
            },
            set: {
                if let tag = journalViewModel.journals[journalViewModel.tag],
                   tag[journalViewModel.id] != nil
                {
                    currentFontSize = $0
                    journalViewModel.journals[journalViewModel.tag]![journalViewModel.id]!.fontSize = $0
                }
            }
        )
        
        return Stepper("字體大小: \(Int(fontSize.wrappedValue))", value: fontSize, in: 10...40)
    }
}
