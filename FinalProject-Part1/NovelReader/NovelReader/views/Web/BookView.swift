//
//  BookView.swift
//  NovelReader
//
//  Created by User06 on 2021/12/25.
//

import SwiftUI
import Kingfisher

@available(iOS 15.0, *)
struct BookView: View {
    @ObservedObject var webNovelFetcher: WebNovelFetcher
    let web: String
    let class_: Class

    var body: some View {
        List {
            ForEach(webNovelFetcher.novelList[web]![class_]!.values.sorted(by: >)) { novel in
                NavigationLink(
                    destination: NovelView(webNovelFetcher: webNovelFetcher, web: web, class_: class_, bookId: novel.id),
                    label: {
                        HStack {
                            VStack {
                                if let image = novel.book.imageLink {
                                    KFImage(URL(string: image)!)
                                        .placeholder({
                                            Image("DefaultImage")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 90, height: 120)
                                        })
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 90, height: 120)
                                }
                                else {
                                    Image("NoImage")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 90, height: 120)
                                }
                                HStack {
                                    ForEach(1 ..< RatingView.maximumRating+1) { idx in
                                        RatingView.starD(for: Double(idx), rating: novel.book.rating[0])
                                            .frame(width: 9)
                                    }
                                    Text(String(format: "%.1f", novel.book.rating[0]))
                                        .font(.caption2)
                                }
                                .padding(.top, 5)
                            }
                            .padding(.trailing)
                            VStack(alignment: .leading) {
                                Text(novel.book.book)
                                    .font(.title2)
                                    .lineLimit(1)
                                Spacer()
                                Group {
                                    Text("作者：" + novel.book.author)
                                        .padding(.top)
                                    Text("章節數：\(novel.book.chapterCount)")
                                    Text("更新狀態：" + novel.book.state)
                                }
                                .font(.caption)
                            }
                        }
                    })
            }
            .padding(.vertical, 10)
        }
        .overlay {
            if let webContent = webNovelFetcher.novelList[web],
               let classContent = webContent[class_],
               classContent.isEmpty {
                ProgressView()
            }
        }
        .refreshable {
            webNovelFetcher.getBookList(web: web, class_: class_)
        }
        .alert("獲取資料失敗", isPresented: $webNovelFetcher.fetchFailed, actions: {
            Button("確定") {}
        }, message: {
            Text("沒有網路連線")
        })
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("書目")
            }
        })
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if let webContent = webNovelFetcher.novelList[web],
               let classContent = webContent[class_],
               classContent.isEmpty {
                webNovelFetcher.getBookList(web: web, class_: class_)
            }
        }
    }
}

@available(iOS 15.0, *)
struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookView(webNovelFetcher: WebNovelFetcher(), web: "筆趣閣", class_: Class(id: 0, name: "首頁"))
        }
    }
}

