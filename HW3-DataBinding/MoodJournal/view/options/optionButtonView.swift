//
//  optionButtonView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/26.
//

import SwiftUI

struct optionButtonView: View {
    @StateObject var journalViewModel: JournalViewModel
    @StateObject var optionViewModel: OptionViewModel
    
    var body: some View {
        Button(action: {
            optionViewModel.showOptions = true
        }, label: {
            Image(systemName: "ellipsis.circle")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(optionViewModel.background.color)
                .background(optionViewModel.background.color.contrast(-0.1))
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.secondary))
                .padding(10)
        })
        .actionSheet(isPresented: $optionViewModel.showOptions) {
            ActionSheet(title: Text("Options"),
                buttons: [
                    .default(Text("新增筆記")) {
                        journalViewModel.createJournal()
                    },
                    .default(Text("設定")) {
                        optionViewModel.showSettings = true
                    },
                    .destructive(Text("清空筆記")) {
                        optionViewModel.showAlert = true
                    },
                    .cancel(Text("取消"))
                ]
            )
        }
        .sheet(isPresented: $optionViewModel.showSettings) {
            SettingView(optionViewModel: optionViewModel)
        }
        .alert(isPresented: $optionViewModel.showAlert) { () -> Alert in
            Alert(title: Text("確定要清空筆記嗎？"),
                  primaryButton: .destructive(Text("Yes")) {
                      journalViewModel.deleteAllJournals()
                  },
                  secondaryButton: .default(Text("Cancel")))
        }
    }
}

struct optionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        optionButtonView(
            journalViewModel: JournalViewModel(),
            optionViewModel: OptionViewModel()
        )
    }
}
