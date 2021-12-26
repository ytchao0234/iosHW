//
//  NovelIntroView.swift
//  NovelReader
//
//  Created by User06 on 2021/12/26.
//

import SwiftUI
import Kingfisher

@available(iOS 15.0, *)
struct NovelIntroView: View {
    @ObservedObject var webNovelFetcher: WebNovelFetcher
    let web: String
    let class_: String
    let bookId: Int
    @State var commantsRating = [3, 2]
    @State var commants = ["wefrgeragarfadsf\nwefadgtrhqt", "faesggqergfeqrefgergadfhkgjabefkjbsjdfuhkweafs"]
    @State var openCommantView: Bool = false
    @State var commant = String()

    var body: some View {
//        let book = webNovelFetcher.bookList[bookId]
        let book = webNovelFetcher.bookList[0]

        return ZStack(alignment: .bottom) {
            Color.white.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    VStack {
                        KFImage(URL(string: book.imageLink)!)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                        HStack {
                            ForEach(1 ..< RatingView.maximumRating+1) { idx in
                                RatingView.starD(for: Double(idx), rating: 2.5)
                                    .frame(width: 12)
                            }
                            Text(String(format: "%.1f", 2.5))
                                .font(.caption2)
                        }
                        .padding(.top, 5)
                    }
                    .padding(.trailing)

                    VStack(alignment: .leading) {
                        Text(book.book)
                            .font(.title)
                        Spacer()
                        Text("作者：" + book.author)
                            .padding(.top)
                        Text("章節數：\(book.chapterCount)")
//                        Text("更新狀態：\(book.state)")
                    }
                    .padding(.vertical)
                }
                .frame(height: 200)

                Divider()

                Text(book.intro)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                
                Divider()

                VStack {
                    ForEach(commantsRating.indices) { idx in
                        HStack {
                            ForEach(1 ..< RatingView.maximumRating+1) { index in
                                RatingView.star(for: index, rating: commantsRating[idx])
                            }
                            Spacer()
                        }
                        .padding()
                        CommantReadView(text: $commants[idx])
                            .frame(width: UIScreen.main.bounds.width * 0.95, alignment: .leading)
                    }
                }
            }
            .padding()
            
            Button (action: {
                openCommantView = true
            }, label: {
                Text("撰寫評論")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.accentColor)
                    .cornerRadius(20)
            })
            .padding(.bottom)
            .background(
                NavigationLink(isActive: $openCommantView, destination: {
                    CommantView(text: $commant)
                }, label: {
                    EmptyView()
                })
            )
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

@available(iOS 15.0, *)
struct NovelIntroView_Previews: PreviewProvider {
    static var previews: some View {
        NovelIntroView(webNovelFetcher: WebNovelFetcher(), web: "筆趣閣", class_: "首頁", bookId: 53)
    }
}
