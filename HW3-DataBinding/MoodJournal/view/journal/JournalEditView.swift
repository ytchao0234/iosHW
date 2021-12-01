//
//  JournalEditView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/24.
//

import SwiftUI

struct JournalEditView: View {
    @StateObject var journalViewModel: JournalViewModel
    @StateObject var optionViewModel: OptionViewModel
    
    @State var currentFontFamily = String()
    @State var currentFontSize = CGFloat()

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Rectangle()
                    .frame(height: 70)
                Form {
                    FontFamilyPicker(
                        journalViewModel: journalViewModel,
                        currentFontFamily: $currentFontFamily
                    )
                    FontSizeStepper(
                        journalViewModel: journalViewModel,
                        currentFontSize: $currentFontSize
                    )
                    TitleTextField(
                        journalViewModel: journalViewModel,
                        currentFontFamily: $currentFontFamily,
                        currentFontSize: $currentFontSize
                    )
                    ContentTextEditor(
                        journalViewModel: journalViewModel,
                        currentFontFamily: $currentFontFamily,
                        currentFontSize: $currentFontSize,
                        geometryHeight: geometry.size.height
                    )
                    DisclosureGroup("其他") {
                        TagPicker(journalViewModel: journalViewModel)
//                                地點
                    }
                }
                .cornerRadius(30)
            }
            .padding(.horizontal)
        }
        .background(optionViewModel.background.color.brightness(-0.12))
        .onAppear {
            if let tag = journalViewModel.journals[journalViewModel.tag],
               let journal = tag[journalViewModel.id]
            {
                currentFontFamily = Journal.fontFamilyList[journal.fontFamily]
                currentFontSize = journal.fontSize
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("編輯筆記")
            }
        })
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear {
            journalViewModel.setTag()
            journalViewModel.saveJournals()
        }
    }
}

struct JournalEditView_Previews: PreviewProvider {
    @State static var journalDict = Journal.defaultDict
    
    static var previews: some View {
        NavigationView {
            JournalEditView(
                journalViewModel: JournalViewModel(),
                optionViewModel: OptionViewModel()
            )
        }
    }
}
