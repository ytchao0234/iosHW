//
//  FindBookView.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/17.
//

import SwiftUI

struct FindBookView: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    @State var searchText: String = ""
    @State var submit: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(webNovelFetcher.webList, id: \.self) { web in
                    FindBookInOneWeb(web: web, text: $searchText, submit: $submit)
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: searchText) { value in
                self.submit = false
            }
            .onSubmit(of: .search) {
                self.submit = true
            }
            .overlay {
                if webNovelFetcher.webList.isEmpty {
                    ProgressView()
                }
            }
            .onAppear {
                if webNovelFetcher.webList.isEmpty {
                    webNovelFetcher.getWebList()
                }
            }
            .onDisappear {
                self.searchText = ""
                webNovelFetcher.searchList.removeAll()
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("找書")
                }
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FindBookInOneWeb: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    let web: String
    @Binding var text: String
    @Binding var submit: Bool
    @State private var expand: Bool = true
    @State var showNovelList = [String: Bool]()

    var listContent: [Novel] {
        if let list = webNovelFetcher.searchList[web] {
            if text.isEmpty {
                return list.values.sorted(by: <)
            }
            else {
                return list.values.sorted(by: <).filter {
                    $0.book.name.contains(text)
                }
            }
        }
        else {
            return [Novel]()
        }
    }
    var body: some View {
        DisclosureGroup("\(web) (\(getBookCount(for: web)))", isExpanded: $expand) {
            ForEach(listContent) { novel in
                BookRow(novel: novel, showNovelList: self.$showNovelList)
            }
        }
        .overlay {
            if let isSearching1 = webNovelFetcher.isSearching1[web], isSearching1 {
                ProgressView()
            }
        }
        .onChange(of: submit) { toSearch in
            if toSearch && !text.isEmpty {
                if webNovelFetcher.searchList[web] != nil {
                    webNovelFetcher.searchList[web]!.removeAll()
                }
                webNovelFetcher.searchBook(web: web, text: text)
            }
        }
    }
    
    func getBookCount(for web: String) -> String {
        if let isSearching1 = webNovelFetcher.isSearching1[web],
           !isSearching1 {
            if let isSearching2 = webNovelFetcher.isSearching2[web], isSearching2 {
                return "\(listContent.count)..."
            }
            else {
                return "\(listContent.count)"
            }
        }
        else {
            return "..."
        }
    }
}
