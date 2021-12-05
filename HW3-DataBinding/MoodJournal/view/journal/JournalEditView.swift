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
    
    @FocusState private var isFocused: Bool

    var body: some View {
        GeometryReader { geometry in
            Form {
                FontFamilyPicker(
                    journalViewModel: journalViewModel,
                    optionViewModel: optionViewModel,
                    currentFontFamily: $currentFontFamily
                )
                FontSizeStepper(
                    journalViewModel: journalViewModel,
                    optionViewModel: optionViewModel,
                    currentFontSize: $currentFontSize
                )
                TitleTextField(
                    journalViewModel: journalViewModel,
                    optionViewModel: optionViewModel,
                    currentFontFamily: $currentFontFamily,
                    currentFontSize: $currentFontSize
                )
                .focused($isFocused)
                
                ContentTextEditor(
                    journalViewModel: journalViewModel,
                    optionViewModel: optionViewModel,
                    currentFontFamily: $currentFontFamily,
                    currentFontSize: $currentFontSize,
                    geometryHeight: 700
                )
                .focused($isFocused)
                
                DisclosureGroup("其他") {
                    TagPicker(
                        journalViewModel: journalViewModel,
                        optionViewModel: optionViewModel
                    )
                    
                    if let tag = journalViewModel.journals[journalViewModel.tag],
                       let journal = tag[journalViewModel.id]
                    {
                        NavigationLink(destination: {
                            MapView(journalViewModel: journalViewModel)
                        }, label: {
                            HStack {
                                Text("選擇地點")
                                    .modifier(FormFactorModifier(color: optionViewModel.background.color))
                                Spacer()
                                Text(String(format: "(%.1f, %.1f)", journal.latitude, journal.longitude))
                                    .foregroundColor(.secondary)
                            }
                        })
                    }
                }
            }
            .background(optionViewModel.background.color.brightness(-0.12))
            .cornerRadius(30)
            .padding()
        }
        .background(optionViewModel.background.color)
        .onAppear {
            if let tag = journalViewModel.journals[journalViewModel.tag],
               let journal = tag[journalViewModel.id]
            {
                currentFontFamily = Journal.fontFamilyList[journal.fontFamily]
                currentFontSize = journal.fontSize
            }
        }
        .onTapGesture {
            isFocused = false
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("編輯筆記")
            }
        })
        .navigationBarTitleDisplayMode(.inline)
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

struct FormFactorModifier: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .padding(.vertical , 5)
            .padding(.horizontal, 15)
            .background(color.brightness(-0.4))
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(color, lineWidth: 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.secondary, lineWidth: 0.5)
                    )
            )
    }
}
