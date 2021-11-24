//
//  ContentView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/16.
//

import SwiftUI

struct ContentView: View {
    @State var journalDict: [UUID: Journal] = Journal.readJournalDict() ?? [:]
//    @State var journalDict: [UUID: Journal] = Journal.defaultDict
    
    @State private var toRead = false
    @State private var toEdit = false
    @State private var journalID: UUID?
    
    @State private var showOptions = false
    
    var body: some View {
        let columns = [GridItem(.adaptive(minimum: 150, maximum: 400), spacing: 10)]
        
        return NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView(.vertical) {
                    LazyVGrid(columns: columns) {
                        ForEach(journalDict.values.sorted()) { journal in
                            Button(action: {
                                self.toRead = true
                                self.journalID = journal.id
                            }, label: {
                                JournalBlockView(journal: journalDict[journal.id]!)
                            })
                            .contextMenu {
                                Button(action: {
                                    self.toRead = true
                                    self.journalID = journal.id
                                }, label: {
                                    Label("閱讀筆記", systemImage: "doc.text.magnifyingglass")
                                })
                                Button(action: {
                                    self.toEdit = true
                                    self.journalID = journal.id
                                }, label: {
                                    Label("編輯筆記", systemImage: "square.and.pencil")
                                })
                                Button(role: .destructive, action: {
                                    journalDict.removeValue(forKey: journal.id)
                                    Journal.deleteAll()
                                    Journal.saveJournalDict(records: journalDict)
                                }, label: {
                                    Label("刪除筆記", systemImage: "trash")
                                })
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
                                let newJournal = Journal(title: "", content: "", time: Date())
                                self.journalDict[newJournal.id] = newJournal
                                self.toEdit = true
                                self.journalID = newJournal.id
                            },
                            .default(Text("設定")) {

                            },
                            .destructive(Text("清空筆記")) {
                                journalDict.removeAll()
                                Journal.deleteAll()
                            },
                            .cancel(Text("取消")) {

                            }
                        ]
                    )
                }
            }
            .padding()
            .background(
                ZStack {
                    if let id = self.journalID, let journal = journalDict[id] {
                        NavigationLink(
                            destination: JournalReadView(journal: journal),
                            isActive: $toRead,
                            label: {
                                EmptyView()
                        })
                        NavigationLink(
                            destination: JournalEditView(journalDict: $journalDict, id: id),
                            isActive: $toEdit,
                            label: {
                                EmptyView()
                        })
                    }
                }
            )
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
