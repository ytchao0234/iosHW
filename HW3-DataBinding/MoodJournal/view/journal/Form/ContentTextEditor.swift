//
//  ContentTextEditor.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import SwiftUI

struct ContentTextEditor: View {
    @StateObject var journalViewModel: JournalViewModel
    @Binding var currentFontFamily: String
    @Binding var currentFontSize: CGFloat
    let geometryHeight: CGFloat
    
    var body: some View {
        let content = Binding (
            get: { () -> String in
                if let tag = journalViewModel.journals[journalViewModel.tag],
                   tag[journalViewModel.id] != nil
                {
                    return journalViewModel.journals[journalViewModel.tag]![journalViewModel.id]!.content
                }
                else {
                    return ""
                }
            },
            set: {
                if let tag = journalViewModel.journals[journalViewModel.tag],
                   tag[journalViewModel.id] != nil
                {
                    journalViewModel.journals[journalViewModel.tag]![journalViewModel.id]!.content = $0
                }
            }
        )
        
        return TextEditor(text: content)
            .font(.custom(currentFontFamily, size: currentFontSize))
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.secondary, lineWidth: 1)
            )
            .frame(height: geometryHeight * 0.45)
    }
}
