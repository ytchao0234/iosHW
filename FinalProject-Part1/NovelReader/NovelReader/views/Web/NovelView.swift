//
//  NovelView.swift
//  NovelReader
//
//  Created by User06 on 2021/12/26.
//

import SwiftUI

struct NovelView: View {
    @ObservedObject var webNovelFetcher: WebNovelFetcher
    let web: String
    let class_: String
    let bookId: Int
    @State var isOpenView = false
    
    var body: some View {
        ZStack {
            HStack {
                ChapterView(webNovelFetcher: webNovelFetcher, web: web, class_: class_, bookId: bookId, isOpenView: $isOpenView)
                    .frame(width: 250)
                Spacer()
            }
            ZStack(alignment: .leading) {
                if webNovelFetcher.chapterNumber == 0 {
                    NovelIntroView(webNovelFetcher: webNovelFetcher, web: web, class_: class_, bookId: bookId)
                }
                else {
                    NovelContentView(webNovelFetcher: webNovelFetcher)
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
        .navigationTitle(webNovelFetcher.chapterList[webNovelFetcher.chapterNumber][0])
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
//            if webNovelFetcher.bookList.isEmpty {
//                webNovelFetcher.previewBookList()
//            }
        }
    }
}

struct NovelView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NovelView(webNovelFetcher: WebNovelFetcher(), web: "筆趣閣", class_: "首頁", bookId: 53)
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
