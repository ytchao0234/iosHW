//
//  WebListsView.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/10.
//

import SwiftUI

struct WebListsView: View {
    var body: some View {
        NavigationView {
            WebView()
        }
    }
}

struct WebView: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    @State private var searchText: String = ""
    
    var listContent: [String] {
        if searchText.isEmpty {
            return webNovelFetcher.webList
        }
        else {
            return webNovelFetcher.webList.filter {
                $0.contains(searchText)
            }
        }
    }

    var body: some View {
        List {
            ForEach(listContent, id: \.self) { web in
                NavigationLink {
                    ClassView(web: web, title: web)
                } label: {
                    Text(web)
                }
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
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
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("網站列表")
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ClassView: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    let web: String
    var list: [Class]? = nil
    var title: String
    @State private var searchText: String = ""
    
    var classList: [Class] {
        if let list = list {
            return list
        }
        else if let list = webNovelFetcher.classList[web] {
            return list
        }
        else {
            return [Class]()
        }
    }
    
    var listContent: [Class] {
        if searchText.isEmpty {
            return classList
        }
        else {
            return classList.filter {
                $0.name.contains(searchText)
            }
        }
    }

    var body: some View {
        List {
            ForEach(listContent, id: \.self) { class_ in
                if class_.child.isEmpty {
                    NavigationLink {
                        BookView(web: web, class_: class_, title: "\(title) - \(class_.name)")
                    } label: {
                        Text(class_.name)
                    }
                }
                else {
                    NavigationLink {
                        ClassView(web: web, list: class_.child, title: "\(title) - \(class_.name)")
                    } label: {
                        HStack {
                            Text(class_.name)
                            Spacer()
                            Image(systemName: "list.bullet")
                        }
                    }
                }
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .overlay {
            if classList.isEmpty {
                ProgressView()
            }
        }
        .onAppear {
            if classList.isEmpty {
                webNovelFetcher.getClassList(web: web)
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("\(title)")
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BookView: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    let web: String
    let class_: Class
    let title: String
    @State var showNovelList = [String: Bool]()
    @State var novel: Novel? = nil
    @State private var searchText: String = ""
    
    var listContent: [Novel] {
        if let list = webNovelFetcher.novelList[class_] {
            if searchText.isEmpty {
                return list.values.sorted(by: <)
            }
            else {
                return list.values.sorted(by: <).filter {
                    $0.book.name.contains(searchText)
                }
            }
        }
        else {
            return [Novel]()
        }
    }

    var body: some View {
        List {
            ForEach(listContent) { novel in
                let showNovel = Binding<Bool> {
                    if let show = showNovelList[novel.id] {
                        return show
                    }
                    else {
                        return false
                    }
                } set: {
                    showNovelList[novel.id] = $0
                }

                Button {
                    self.novel = novel
                    self.showNovelList[novel.id] = true
                } label: {
                    BookRow(novel: novel)
                }
                .onAppear {
                    self.showNovelList[novel.id] = false
                }
                .fullScreenCover(isPresented: showNovel, onDismiss: {}) {
                    NovelView(novel: novel, showNovel: showNovel)
                }
            }
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .overlay {
            if webNovelFetcher.novelList[class_]!.isEmpty {
                ProgressView()
            }
        }
        .onAppear {
            if webNovelFetcher.novelList[class_]!.isEmpty {
                webNovelFetcher.getBookList(web: web, class_: class_)
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("\(title)")
            }
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BookRow: View {
    @EnvironmentObject var backgroundViewModel: BackgroundViewModel
    let novel: Novel
    var body: some View {
        HStack {
            VStack {
                AsyncImage(url: URL(string: novel.book.imageLink)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        
                } placeholder: {
                    ProgressView()
                        .frame(width: 60, height: 80)
                        .background(Color.secondary.opacity(0.2))
                }
                .frame(width: 60)
                
                HStack {
                    RatingView(rating: .constant(novel.rating))
                        .disabled(true)
                    Text(String(format: "%.1f", novel.rating.amount))
                        .font(.custom("", size: 8))
                        .foregroundColor(Color("fontColor"))
                }
            }
            .frame(width: 80)
            
            VStack(alignment: .leading) {
                Text(novel.book.name)
                    .lineLimit(1)
                
                Spacer()
                
                Group {
                    Text("作者\t\t: \(novel.book.author)")
                    Text("更新狀態\t: \(novel.book.state)")
                }
                .font(.caption)
            }
            .foregroundColor(Color("fontColor"))
            .padding(.leading, 10)
        }
        .padding(.vertical, 5)
    }
}
