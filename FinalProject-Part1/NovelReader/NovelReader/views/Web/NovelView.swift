//
//  NovelView.swift
//  NovelReader
//
//  Created by User06 on 2021/12/26.
//

import SwiftUI

@available(iOS 15.0, *)
struct NovelView: View {
    @ObservedObject var webNovelFetcher: WebNovelFetcher
    let web: String
    let class_: Class
    let bookId: UUID
    @State var isOpenView = false
    
    var body: some View {
        ZStack {
            HStack {
                ChapterView(webNovelFetcher: webNovelFetcher, web: web, class_: class_, bookId: bookId, isOpenView: $isOpenView)
                    .frame(width: 250)
                    .offset(x: 5)
                Spacer()
            }
            ZStack(alignment: .leading) {
                if webNovelFetcher.chapterNumber == 0 {
                    NovelIntroView(webNovelFetcher: webNovelFetcher, web: web, class_: class_, bookId: bookId)
                }
                else {
                    NovelContentView(webNovelFetcher: webNovelFetcher, web: web, class_: class_, bookId: bookId)
                }
                Button(action: {
                    isOpenView.toggle()
                }, label: {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .padding(5)
                        .foregroundColor(Color.white.opacity(0.5))
                        .background(Color.secondary.clipShape(HalfCircle()))
                })
            }
            .offset(x: isOpenView ? 250 : 0)
            .animation(.linear(duration: 0.2))
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                if webNovelFetcher.novelList[web]![class_]![bookId]!.chapter.chapterTitles.isEmpty {
                    Text(webNovelFetcher.novelList[web]![class_]![bookId]!.book.book)
                        .font(.caption)
                }
                else {
                    Text(webNovelFetcher.novelList[web]![class_]![bookId]!.chapter.chapterTitles[webNovelFetcher.chapterNumber])
                        .font(.caption)
                        .fixedSize()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    if let webContent = webNovelFetcher.novelList[web],
                       let classContent = webContent[class_],
                       let novel = classContent[bookId] {
                        webNovelFetcher.novelList[web]![class_]![bookId]!.chapter.chapterContents[webNovelFetcher.chapterNumber] = ""

                        webNovelFetcher.getChapterContent(web: web, class_: class_, bookId: bookId, chapterLink: novel.chapter.chapterLinks[webNovelFetcher.chapterNumber])
                    }
                }, label: {
                    Image(systemName: "arrow.triangle.2.circlepath")
                })
                .alert("獲取資料失敗", isPresented: $webNovelFetcher.fetchFailed, actions: {
                    Button("確定") {}
                }, message: {
                    Text("沒有網路連線")
                })
            }
        })
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if let webContent = webNovelFetcher.novelList[web],
               let classContent = webContent[class_],
               let novel = classContent[bookId],
               novel.chapter.chapterTitles.isEmpty {
                webNovelFetcher.getChapterList(web: web, class_: class_, bookId: bookId)
            }
        }
        .onDisappear {
            webNovelFetcher.chapterNumber = 0
        }
    }
}

@available(iOS 15.0, *)
struct NovelView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NovelView(webNovelFetcher: WebNovelFetcher(), web: "筆趣閣", class_: Class(id: 0, name:"首頁"), bookId: UUID())
        }
    }
}

struct HalfCircle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addArc(center: CGPoint(x: 0, y: rect.height / 2), radius: rect.width, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 90), clockwise: false)
            path.closeSubpath()
        }
    }
}
