//
//  ContentTextEditor.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import SwiftUI

struct ContentTextEditor: View {
    @StateObject var journalViewModel: JournalViewModel
    @StateObject var optionViewModel: OptionViewModel
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
        
        return ZStack {
            RoundedRectangle(cornerRadius: 5)
                .stroke(optionViewModel.background.color, lineWidth: 5)
                .background(optionViewModel.background.color.brightness(-0.4))
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.secondary, lineWidth: 0.5)
                )
            
            TextEditor(text: content)
                .font(.custom(currentFontFamily, size: currentFontSize))
                .foregroundColor(optionViewModel.background.color)
        }
        .frame(height: geometryHeight * 0.55)
    }
}
