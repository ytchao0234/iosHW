//
//  ChapterView.swift
//  NovelReader
//
//  Created by User06 on 2021/12/26.
//

import SwiftUI

@available(iOS 15.0, *)
struct ChapterView: View {
    @ObservedObject var webNovelFetcher: WebNovelFetcher
    let web: String
    let class_: Class
    let bookId: UUID
    @Binding var isOpenView: Bool

    var body: some View {
        List {
            Button(action: {
                webNovelFetcher.getChapterList(web: web, class_: class_, bookId: bookId)
            }, label: {
                Label("更新章節列表", systemImage: "arrow.triangle.2.circlepath")
            })
            .alert("獲取資料失敗", isPresented: $webNovelFetcher.fetchFailed, actions: {
                Button("確定") {}
            }, message: {
                Text("沒有網路連線")
            })
            ForEach(webNovelFetcher.novelList[web]![class_]![bookId]!.chapter.chapterLinks.indexed(), id: \.1.self) { idx, chapter in
                if webNovelFetcher.chapterNumber == idx {
                    Button(action: {
                        webNovelFetcher.chapterNumber = idx
                        isOpenView = false
                        if let webContent = webNovelFetcher.novelList[web],
                           let classContent = webContent[class_],
                           let novel = classContent[bookId],
                           novel.chapter.chapterContents[webNovelFetcher.chapterNumber].isEmpty {
                            webNovelFetcher.getChapterContent(web: web, class_: class_, bookId: bookId, chapterLink: novel.chapter.chapterLinks[webNovelFetcher.chapterNumber])
                        }
                    }, label: {
                        Text(webNovelFetcher.novelList[web]![class_]![bookId]!.chapter.chapterTitles[idx])
                            .lineLimit(1)
                    })
                    .listRowBackground(
                        Color.secondary.opacity(0.3)
                        .overlay(
                            EdgeBorder(width: 5, edges: [.leading])
                                .foregroundColor(Color.accentColor.opacity(0.5))
                        )
                    )
                }
                else {
                    Button(action: {
                        webNovelFetcher.chapterNumber = idx
                        isOpenView = false
                        if let webContent = webNovelFetcher.novelList[web],
                           let classContent = webContent[class_],
                           let novel = classContent[bookId],
                           novel.chapter.chapterContents[webNovelFetcher.chapterNumber].isEmpty {
                            webNovelFetcher.getChapterContent(web: web, class_: class_, bookId: bookId, chapterLink: novel.chapter.chapterLinks[webNovelFetcher.chapterNumber])
                        }
                    }, label: {
                        Text(webNovelFetcher.novelList[web]![class_]![bookId]!.chapter.chapterTitles[idx])
                            .lineLimit(1)
                    })
                    .listRowBackground(
                        Color.secondary.opacity(0.1)
                    )
                }
            }
            .padding(10)
        }
        .overlay {
            if let webContent = webNovelFetcher.novelList[web],
               let classContent = webContent[class_],
               let book = classContent[bookId],
               book.chapter.chapterTitles.isEmpty {
                ProgressView()
            }
        }
        .listStyle(PlainListStyle())
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if let webContent = webNovelFetcher.novelList[web],
               let classContent = webContent[class_],
               let book = classContent[bookId],
               book.chapter.chapterTitles.isEmpty {
                webNovelFetcher.getChapterList(web: web, class_: class_, bookId: bookId)
            }
        }
    }
}

@available(iOS 15.0, *)
struct ChapterView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterView(webNovelFetcher: WebNovelFetcher(), web: "筆趣閣", class_: Class(id: 0, name:"首頁"), bookId: UUID(), isOpenView: .constant(false))
            .preferredColorScheme(.dark)
    }
}

// This is taken from the Release Notes, with a typo correction, marked below
struct IndexedCollection<Base: RandomAccessCollection>: RandomAccessCollection {
    typealias Index = Base.Index
    typealias Element = (index: Index, element: Base.Element)

    let base: Base

    var startIndex: Index { base.startIndex }

   // corrected typo: base.endIndex, instead of base.startIndex
    var endIndex: Index { base.endIndex }

    func index(after i: Index) -> Index {
        base.index(after: i)
    }

    func index(before i: Index) -> Index {
        base.index(before: i)
    }

    func index(_ i: Index, offsetBy distance: Int) -> Index {
        base.index(i, offsetBy: distance)
    }

    subscript(position: Index) -> Element {
        (index: position, element: base[position])
    }
}

extension RandomAccessCollection {
    func indexed() -> IndexedCollection<Self> {
        IndexedCollection(base: self)
    }
}

struct EdgeBorder: Shape {

    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }

            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY
                case .bottom: return rect.maxY - width
                }
            }

            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return self.width
                }
            }

            var h: CGFloat {
                switch edge {
                case .top, .bottom: return self.width
                case .leading, .trailing: return rect.height
                }
            }
            path.addPath(Path(CGRect(x: x, y: y, width: w, height: h)))
        }
        return path
    }
}
