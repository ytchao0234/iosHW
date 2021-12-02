//
//  TitleTextField.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import SwiftUI

struct TitleTextField: View {
    @StateObject var journalViewModel: JournalViewModel
    @StateObject var optionViewModel: OptionViewModel
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
        
        return ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .stroke(optionViewModel.background.color, lineWidth: 5)
                .background(optionViewModel.background.color.brightness(-0.4))
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.secondary, lineWidth: 0.5)
                )
            
            if title.wrappedValue.isEmpty {
                Text("請輸入標題...")
                    .foregroundColor(optionViewModel.background.color)
                    .opacity(0.5)
                    .padding(5)
            }
                
            TextField("", text: title)
                .font(.custom(currentFontFamily, size: currentFontSize))
                .foregroundColor(optionViewModel.background.color)
                .padding(5)
        }
    }
}
