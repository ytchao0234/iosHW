//
//  TitleTextField.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import SwiftUI

struct TitleTextField: View {
    @StateObject var journalViewModel: JournalViewModel
    @Binding var currentFontFamily: String
    @Binding var currentFontSize: CGFloat
    
    var body: some View {
        let title = Binding (
            get: { () -> String in
                if let tag = journalViewModel.journals[journalViewModel.tag],
                   tag[journalViewModel.id] != nil
                {
                    return journalViewModel.journals[journalViewModel.tag]![journalViewModel.id]!.title
                }
                else {
                    return ""
                }
            },
            set: {
                if let tag = journalViewModel.journals[journalViewModel.tag],
                   tag[journalViewModel.id] != nil
                {
                    journalViewModel.journals[journalViewModel.tag]![journalViewModel.id]!.title = $0
                }
            }
        )
        
        return TextField("標題", text: title,
                         prompt: Text("請輸入標題"))
            .font(.custom(currentFontFamily, size: currentFontSize))
            .padding(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.secondary, lineWidth: 1)
            )
    }
}
