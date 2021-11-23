//
//  ContentView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/16.
//

import SwiftUI

struct ContentView: View {
//    @State var journalList: [Journal] = Journal.readJournalList() ?? []
    @State var journalList: [Journal] = [Journal.defaultJournal, Journal(title: "fff", content: "www", time: Date()), Journal(title: "fff", content: "www", time: Date()), Journal(title: "ffffffffffffffffffffffffffffffffffffffffff", content: "www", time: Date())]
    
    var body: some View {
        let columns = [GridItem(.adaptive(minimum: 150, maximum: 400), spacing: 10)]
        
        return NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(journalList.indices) { index in
                        NavigationLink(
                            destination: JournalEditView(journalList: $journalList, index: index),
                            label: {
                                JournalBlockView(journal: journalList[index])
                            })
                    }
                }
            }
            .padding()
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("我的心情小記")
                        .font(.custom("Yuppy TC Regular", size: 18))
                }
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
