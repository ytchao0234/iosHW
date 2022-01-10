//
//  WebListsView.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/10.
//

import SwiftUI

struct WebListsView: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher

    var body: some View {
        NavigationView {
            WebView()
        }
    }
}

struct WebView: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher

    var body: some View {
        List {
            ForEach(webNovelFetcher.webList, id: \.self) { web in
                NavigationLink {
                    ClassView(web: web, title: web)
                } label: {
                    Text(web)
                }
            }
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

    var body: some View {
        Group {
            if let classList = list {
                List {
                    ForEach(classList, id: \.self) { class_ in
                        NavigationLink {
                            if class_.child.isEmpty {
                                BookView(web: web, class_: class_, title: "\(title) - \(class_.name)")
                            }
                            else {
                                ClassView(web: web, list: class_.child, title: "\(title) - \(class_.name)")
                            }
                        } label: {
                            Text(class_.name)
                        }
                    }
                }
            }
            else if let classList = webNovelFetcher.classList[web] {
                List {
                    ForEach(classList, id: \.self) { class_ in
                        if class_.child.isEmpty {
                            NavigationLink {
                                BookView(web: web, class_: class_, title: "\(title) - \(class_.name)")
                            } label: {
                                Text(class_.name)
                            }
                        }
                        else {
                            NavigationLink {
                                ClassView(web: web, list: class_.child, title: "\(web) - \(class_.name)")
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
            }
            else {
                Text("400 Bad Request.\n\(web) is Not Found.")
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

    var body: some View {
        Group {
            if let bookList = webNovelFetcher.novelList[class_] {
                List {
                    ForEach(bookList.values.sorted(by: <)) { novel in
                        NavigationLink {
    //                        NovelView(novel: novel)
                        } label: {
                            HStack {
                                AsyncImage(url: URL(string: novel.book.imageLink)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60)
                                        
                                } placeholder: {
                                    Color.yellow
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(novel.book.name)
                                        .lineLimit(1)
                                    
                                    Spacer()
                                    
                                    Group {
                                        Text("\(novel.rating.amount) \(novel.rating.number)")
                                        Text("\(novel.commant.count)")
                                        Text("作者\t\t: \(novel.book.author)")
                                        Text("更新狀態\t: \(novel.book.state)")
                                    }
                                    .font(.caption)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                    }
                }
                .overlay {
                    if bookList.isEmpty {
                        ProgressView()
                    }
                }
                .onAppear {
                    if bookList.isEmpty {
                        webNovelFetcher.getBookList(web: web, class_: class_)
                    }
                }
            }
            else {
                Text("400 Bad Request.\n\(class_.name) is Not Found.")
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
