//
//  optionButtonView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/26.
//

import SwiftUI

struct optionButtonView: View {
    @Binding var journalDict: [String: [UUID: Journal]]
    @Binding var journalTag: String?
    @Binding var journalID: UUID?
    @Binding var toEdit: Bool
    
    @State private var showOptions = false
    
    var body: some View {
        Button(action: {
            self.showOptions = true
        }, label: {
            Image(systemName: "ellipsis.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.purple)
                .background(Circle().fill(Color.white))
                .padding(10)
        })
        .actionSheet(isPresented: self.$showOptions) {
            ActionSheet(title: Text("Options"),
                buttons: [
                    .default(Text("新增筆記")) {
                        self.newJournal()
                    },
                    .default(Text("設定")) {
                        self.setting()
                    },
                    .destructive(Text("清空筆記")) {
                        self.deleteAll()
                    },
                    .cancel(Text("取消"))
                ]
            )
        }
    }
}

struct optionButtonView_Previews: PreviewProvider {
    @State static var journalDict: [String: [UUID: Journal]] = Journal.defaultDict
    @State static var toEdit = false
    @State static var journalID: UUID?
    @State static var journalTag: String?
    
    static var previews: some View {
        optionButtonView(
            journalDict: $journalDict,
            journalTag: $journalTag,
            journalID: $journalID,
            toEdit: $toEdit
        )
    }
}

extension optionButtonView {
    func newJournal() {
        let newJournal = Journal(title: "", content: "", time: Date(), fontSize: 18, fontFamily: 0, moodTag: 0)

        if self.journalDict["無標籤"] == nil {
            self.journalDict["無標籤"] = [newJournal.id: newJournal]
        }
        else {
            self.journalDict["無標籤"]![newJournal.id] = newJournal
        }
        
        toEdit = true
        journalTag = "無標籤"
        journalID = newJournal.id
    }
    
    func setting() {
        
    }
    
    func deleteAll() {
        journalDict.removeAll()
        Journal.deleteAll()
    }
}
