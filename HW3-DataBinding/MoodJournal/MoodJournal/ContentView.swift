//
//  ContentView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/16.
//

import SwiftUI

struct ContentView: View {
    @State var journalDict: [String:[UUID: Journal]] = Journal.readJournalDict() ?? [:]
//    @State var journalDict: [String: [UUID: Journal]] = Journal.defaultDict
    @State var searchText = ""
    @State var toRead = false
    @State var toEdit = false
    @State var journalID: UUID?
    @State var journalTag: String?
    
    var body: some View {
        let columns = [GridItem(.adaptive(minimum: 150, maximum: 400), spacing: 10)]
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .bottomTrailing) {
                    VStack {
                        SearchBarView(text: $searchText)
                            .padding(.bottom)
                        
                        ScrollView(.vertical) {
                            ForEach(
                                SearchBarView
                                    .getFilterItems(
                                        searchText: searchText,
                                        dict: journalDict
                                    ).keys.sorted(by: sortTag)
                                , id: \.self)
                            { tag in
                                
                                Section(header: Text(tag)) {
                                    LazyVGrid(columns: columns) {
                                        ForEach(
                                            SearchBarView
                                            .getFilterItems(
                                                searchText: searchText,
                                                dict: journalDict
                                            )[tag]!.values.sorted())
                                        { journal in
                                            
                                            JournalBlockButton(
                                                journalDict: $journalDict,
                                                journalTag: $journalTag,
                                                journalID: $journalID,
                                                toRead: $toRead,
                                                toEdit: $toEdit,
                                                tag: tag,
                                                journal: journal
                                            )
                                            
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                    
                    optionButtonView(
                        journalDict: $journalDict,
                        journalTag: $journalTag,
                        journalID: $journalID,
                        toEdit: $toEdit
                    )
                }
                .frame(
                    width: geometry.size.width * 0.9,
                    height: geometry.size.height * 0.95,
                    alignment: .bottomTrailing
                )
                .padding()
                .background(
                    readAndEditNavLinks(
                        journalDict: $journalDict,
                        journalTag: $journalTag,
                        journalID: $journalID,
                        toRead: $toRead,
                        toEdit: $toEdit
                ))
            }
            .onAppear {
                if let tag = journalTag,
                   let id = journalID,
                   let journalDictTag = journalDict[tag],
                   let journal = journalDictTag[id],
                   journal.isEmpty()
                {
                    journalDict[tag]!.removeValue(forKey: id)

                    if NSDictionary(dictionary: journalDict[tag]!)
                        .isEqual(to: [:])
                    {
                        journalDict.removeValue(forKey: tag)
                    }
                }
            }
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

func sortTag(lhs: String, rhs: String) -> Bool {
    if lhs == "無標籤" {
        return true
    }
    else if rhs == "無標籤" {
        return false
    }
    else {
        return lhs < rhs
    }
}
