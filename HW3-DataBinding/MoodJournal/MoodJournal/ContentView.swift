//
//  ContentView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/16.
//

import SwiftUI

struct ContentView: View {
    @State var journalDict: [String:[UUID: Journal]] = Journal.readJournalDict() ?? [:]
//    @State var journalDict: [UUID: Journal] = Journal.defaultDict
    
    @State private var toRead = false
    @State private var toEdit = false
    @State private var journalID: UUID?
    @State private var journalTag: String?
    
    @State private var showOptions = false
    
    var body: some View {
        let columns = [GridItem(.adaptive(minimum: 150, maximum: 400), spacing: 10)]
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .bottomTrailing) {
                    ScrollView(.vertical) {
                        ForEach(journalDict.keys.sorted(by: sortTag), id: \.self) { tag in
                            Section(header: Text(tag)) {
                                LazyVGrid(columns: columns) {
                                    ForEach(journalDict[tag]!.values.sorted()) { journal in
                                        Button(action: {
                                            print(tag)
                                            print(journal)
                                            self.toRead = true
                                            self.journalTag = tag
                                            self.journalID = journal.id
                                        }, label: {
                                            JournalBlockView(journal: journal)
                                        })
                                        .contextMenu {
                                            Button(action: {
                                                self.toRead = true
                                                self.journalTag = tag
                                                self.journalID = journal.id
                                            }, label: {
                                                Label("閱讀筆記", systemImage: "doc.text.magnifyingglass")
                                            })
                                            Button(action: {
                                                self.toEdit = true
                                                self.journalTag = tag
                                                self.journalID = journal.id
                                            }, label: {
                                                Label("編輯筆記", systemImage: "square.and.pencil")
                                            })
                                            Button(role: .destructive, action: {
                                                journalDict[tag]!.removeValue(forKey: journal.id)
                                                if let journalDictTag = journalDict[tag],
                                                   NSDictionary(dictionary: journalDictTag).isEqual(to: [:]) {
                                                    journalDict.removeValue(forKey: tag)
                                                }
                                                Journal.deleteAll()
                                                Journal.saveJournalDict(records: journalDict)
                                            }, label: {
                                                Label("刪除筆記", systemImage: "trash")
                                            })
                                        }
                                    }
                                }
                            }
                        }
                    }

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
                                    let newJournal = Journal(title: "", content: "", time: Date(), fontSize: 18, fontFamily: 0, moodTag: 0)

                                    self.toEdit = true
                                    self.journalTag = "無標籤"
                                    self.journalID = newJournal.id

                                    if self.journalDict[self.journalTag!] == nil {
                                        self.journalDict[self.journalTag!] = [newJournal.id: newJournal]
                                    }
                                    else {
                                        self.journalDict[self.journalTag!]![newJournal.id] = newJournal
                                    }

                                },
                                .default(Text("設定")) {

                                },
                                .destructive(Text("清空筆記")) {
                                    journalDict.removeAll()
                                    Journal.deleteAll()
                                },
                                .cancel(Text("取消"))
                            ]
                        )
                    }
                }
                .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.95, alignment: .bottomTrailing)
                .padding()
                .background(
                    ZStack {
                        if let tag = self.journalTag, let id = self.journalID, let journalDictTag = journalDict[tag], let journal = journalDictTag[id] {
                            NavigationLink(
                                destination: JournalReadView(journal: journal),
                                isActive: $toRead,
                                label: {
                                    EmptyView()
                            })
                            NavigationLink(
                                destination: JournalEditView(journalDict: $journalDict, tag: tag, id: id),
                                isActive: $toEdit,
                                label: {
                                    EmptyView()
                            })
                        }
                    }
                )
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
    else if rhs == "無標題" {
        return false
    }
    else {
        return lhs < rhs
    }
}
