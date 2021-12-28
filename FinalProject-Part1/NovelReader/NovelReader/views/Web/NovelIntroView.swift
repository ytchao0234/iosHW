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
    let class_: Class
    let bookId: UUID
    @State var openCommantView: Bool = false

    var body: some View {
        let novel = webNovelFetcher.novelList[web]![class_]![bookId]!

        return ZStack(alignment: .bottom) {
            Color.white.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    VStack {
                        if let image = novel.book.imageLink {
                            KFImage(URL(string: image)!)
                                .placeholder({
                                    Image("DefaultImage")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 99, height: 132)
                                })
                                .resizable()
                                .scaledToFit()
                                .frame(width: 99, height: 132)
                        }
                        else {
                            Image("NoImage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 99, height: 132)
                        }
                        VStack {
                            HStack {
                                ForEach(1 ..< RatingView.maximumRating+1) { idx in
                                    RatingView.starD(for: Double(idx), rating: novel.book.rating[0])
                                        .frame(width: 9)
                                }
                            }
                            .padding(.top, 5)

                            Text(String(format: "%.1f(%d)", novel.book.rating[0], novel.book.rating[1]))
                                .font(.caption2)
                        }
                    }
                    .padding(.trailing)

                    VStack(alignment: .leading) {
                        Text(novel.book.book)
                            .font(.title)
                        Spacer()
                        Text("作者：" + novel.book.author)
                            .padding(.top)
                        Text("章節數：\(novel.book.chapterCount)")
                        Text("更新狀態：\(novel.book.state)")
                    }
                    .padding(.vertical)
                }
                .frame(height: 200)

                Divider()

                Text(novel.book.intro)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                
                Divider()

                VStack {
                    if webNovelFetcher.novelList[web]![class_]![bookId]!.commants.count > 0 {
                        ForEach(webNovelFetcher.novelList[web]![class_]![bookId]!.commants, id: \.self) { commant in
                            
                            let comma = Binding { () -> String in
                                return commant[1]
                            } set: {_,_ in
                                
                            }

                            HStack {
                                ForEach(1 ..< RatingView.maximumRating+1) { index in
                                    RatingView.star(for: index, rating: Int(commant[0])!)
                                }
                                Spacer()
                            }
                            .padding()
                            CommantReadView(text: comma)
                                .frame(width: UIScreen.main.bounds.width * 0.95, alignment: .leading)
                        }
                    }
                    else {
                        Text("-- 目前還沒有評論 --")
                            .foregroundColor(Color.secondary)
                            .padding(50)
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
            .sheet(isPresented: $openCommantView) {
                CommantView(webNovelFetcher: webNovelFetcher, web: web, class_: class_, bookId: bookId, open: $openCommantView)
            }
            .padding(.bottom)
        }
        .onAppear {
            if let webContent = webNovelFetcher.novelList[web],
               let classContent = webContent[class_],
               let _ = classContent[bookId] {
                webNovelFetcher.getCommant(web: web, class_: class_, bookId: bookId)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

@available(iOS 15.0, *)
struct NovelIntroView_Previews: PreviewProvider {
    static var previews: some View {
        NovelIntroView(webNovelFetcher: WebNovelFetcher(), web: "筆趣閣", class_: Class(id: 0, name: "首頁"), bookId: UUID())
    }
}
