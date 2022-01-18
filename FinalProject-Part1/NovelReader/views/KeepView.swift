//
//  KeepView.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/18.
//

import SwiftUI
import CoreData

struct KeepView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Novel_Current.readTime, ascending: false)],
        animation: .default)
    private var current: FetchedResults<Novel_Current>
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Novel_Keep.readTime, ascending: false)],
        animation: .default)
    private var keep: FetchedResults<Novel_Keep>

    @EnvironmentObject var keepViewModel: KeepViewModel
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    @State var showNovelList = [String: Bool]()
    @State private var searchText_current: String = ""
    @State private var searchText_keep: String = ""
    @State private var edit_current: Bool = false
    @State private var edit_keep: Bool = false
    @State private var widgetNovelId: String? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                if keepViewModel.selection == 0 {
                    if current.count > 0 {
                        ZStack(alignment: .bottomTrailing) {
                            List {
                                ForEach(current) { novel in
                                    if let id = novel.id, let nov = webNovelFetcher.flattenNovelList[id] {
                                        if self.searchText_current.isEmpty || nov.book.name.contains(self.searchText_current) {
                                            BookRow(novel: nov, showNovelList: self.$showNovelList)
                                        }
                                    }
                                    else {
                                        ProgressView()
                                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                    }
                                }
                                .onDelete(perform: deleteCurrent)
                            }
                            .searchable(text: $searchText_current, placement: .navigationBarDrawer(displayMode: .always))
                            .environment(\.editMode, .constant(self.edit_current ? EditMode.active : EditMode.inactive)).animation(Animation.spring(), value: self.edit_current)
                            Button {
                                self.edit_current.toggle()
                            } label: {
                                Text(self.edit_current ? "Done" : "Edit")
                            }
                            .modifier(EditButtonModifier())
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    }
                    else {
                        Text("-- 暫無記錄 --")
                            .foregroundColor(.secondary.opacity(0.7))
                    }
                }
                else if keepViewModel.selection == 1 {
                    if keep.count > 0 {
                        ZStack(alignment: .bottomTrailing) {
                            List {
                                ForEach(keep) { novel in
                                    if let id = novel.id, let nov = webNovelFetcher.flattenNovelList[id] {
                                        if self.searchText_keep.isEmpty || nov.book.name.contains(self.searchText_keep) {
                                            BookRow(novel: nov, showNovelList: self.$showNovelList)
                                        }
                                    }
                                    else {
                                        ProgressView()
                                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                    }
                                }
                                .onDelete(perform: deleteKeep)
                            }
                            .searchable(text: $searchText_keep, placement: .navigationBarDrawer(displayMode: .always))
                            .environment(\.editMode, .constant(self.edit_keep ? EditMode.active : EditMode.inactive)).animation(Animation.spring(), value: self.edit_keep)
                            Button {
                                self.edit_keep.toggle()
                            } label: {
                                Text(self.edit_keep ? "Done" : "Edit")
                            }
                            .modifier(EditButtonModifier())
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    }
                    else {
                        Text("-- 暫無收藏 --")
                            .foregroundColor(.secondary.opacity(0.7))
                    }
                }
            }
            .onOpenURL { url in
                self.widgetNovelId = "\(url)"

                addWidgetNovel()
                if webNovelFetcher.flattenNovelList[widgetNovelId!] == nil {
                    webNovelFetcher.getBook(id: widgetNovelId!, readTime: Date())
                }
            }
            .onAppear {
                current.forEach { novel in
                    if webNovelFetcher.flattenNovelList[novel.id!] == nil {
                        webNovelFetcher.getBook(id: novel.id!, readTime: novel.readTime)
                    }
                }
                keep.forEach { novel in
                    if webNovelFetcher.flattenNovelList[novel.id!] == nil {
                        webNovelFetcher.getBook(id: novel.id!, readTime: novel.readTime, keep: true)
                    }
                }
            }
            .onChange(of: keepViewModel.current) { _ in
                updateCurrent()
            }
            .onChange(of: keepViewModel.keep) { _ in
                updateKeep()
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Picker(selection: $keepViewModel.selection) {
                        ForEach(keepViewModel.selectionMenu.indices) { index in
                            Text(keepViewModel.selectionMenu[index])
                                .tag(index)
                        }
                    } label: {
                        Text("selection")
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func updateKeep() {
        withAnimation {
            if let novel = keepViewModel.keep {
                if let index = keep.firstIndex(where: { $0.id == novel.id }) {
                    keep[index].readTime = novel.readTime
                } else {
                    let newItem = Novel_Keep(context: viewContext)
                    newItem.id = novel.id
                    newItem.readTime = novel.readTime
                }
            }
            else {
                if let lastKeep = keepViewModel.lastKeep, let index = keep.firstIndex(where: { $0.id == lastKeep.id }) {
                    viewContext.delete(keep[index])
                }
            }

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("ERROR::deleteCurrent: \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func deleteKeep(offsets: IndexSet) {
        withAnimation {
            offsets.map { keep[$0] }.forEach {
                webNovelFetcher.flattenNovelList[$0.id!]!.keep = false
                viewContext.delete($0)
            }

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("ERROR::deleteCurrent: \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func addWidgetNovel() {
        withAnimation {
            if let novelId = widgetNovelId {
                if let index = current.firstIndex(where: { $0.id == novelId }) {
                    current[index].readTime = Date()
                } else {
                    let newItem = Novel_Current(context: viewContext)
                    newItem.id = novelId
                    newItem.readTime = Date()
                }

                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("ERROR::deleteCurrent: \(nsError), \(nsError.userInfo)")
                }
            }
        }
    }
    
    func updateCurrent() {
        withAnimation {
            if let novel = keepViewModel.current {
                if let index = current.firstIndex(where: { $0.id == novel.id }) {
                    current[index].readTime = novel.readTime
                } else {
                    let newItem = Novel_Current(context: viewContext)
                    newItem.id = novel.id
                    newItem.readTime = novel.readTime
                }
                
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("ERROR::deleteCurrent: \(nsError), \(nsError.userInfo)")
                }
            }
        }
    }
    
    func deleteCurrent(offsets: IndexSet) {
        withAnimation {
            offsets.map { current[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("ERROR::deleteCurrent: \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct KeepView_Previews: PreviewProvider {
    static var previews: some View {
        KeepView()
    }
}

struct EditButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(.body, design: .monospaced))
            .foregroundColor(.white)
            .padding()
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
    }
}
