//
//  CommantView.swift
//  NovelReader
//
//  Created by FanRende on 2021/12/26.
//

import SwiftUI

@available(iOS 15.0, *)
struct CommantView: View {
    @ObservedObject var webNovelFetcher: WebNovelFetcher
    let web: String
    let class_: Class
    let bookId: UUID
    @Binding var open: Bool
    @FocusState var focus: Bool
    @State var rating = Int(3)

    var body: some View {
        let commant = Binding { () -> String in
            if let webContent = webNovelFetcher.novelList[web],
               let classContent = webContent[class_],
               let novel = classContent[bookId] {
                return novel.commant[1]
            }
            else {
                return ""
            }
        } set: {
            if let webContent = webNovelFetcher.novelList[web],
               let classContent = webContent[class_],
               let _ = classContent[bookId] {
                webNovelFetcher.novelList[web]![class_]![bookId]!.commant[1] = $0
            }
        }

        
        return NavigationView {
            VStack {
                RatingView(rating: $rating)
                    .padding()
                CommantReadView(text: commant)
                    .padding()
                    .background(Color.yellow.opacity(0.3))
                ZStack {
                    CommantEditView(text: commant, focus: $focus)
                }
            }
            .padding(.vertical)
            .onTapGesture {
                focus = false
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("取消") {
                        open = false
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("撰寫評論")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("送出") {
                        if let webContent = webNovelFetcher.novelList[web],
                           let classContent = webContent[class_],
                           let novel = classContent[bookId] {
                            let origin_rating = novel.book.rating
                            let rating = Double(self.rating)
                            webNovelFetcher.novelList[web]![class_]![bookId]!.book.rating[0] = (rating + origin_rating[0] * origin_rating[1]) / (origin_rating[1] + 1)
                            webNovelFetcher.novelList[web]![class_]![bookId]!.book.rating[1] = origin_rating[1] + 1
                            
                            print(webNovelFetcher.novelList[web]![class_]![bookId]!.book.rating[1])
                            
                            webNovelFetcher.novelList[web]![class_]![bookId]!.commants.append([String(self.rating), commant.wrappedValue])
                            webNovelFetcher.setCommant(bookId: bookId, commants: webNovelFetcher.novelList[web]![class_]![bookId]!.commants)
                            webNovelFetcher.setRating(bookId: bookId, rating: webNovelFetcher.novelList[web]![class_]![bookId]!.book.rating)
                        }

                        open = false
                    }
                }
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

@available(iOS 15.0, *)
struct CommantView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommantView(webNovelFetcher: WebNovelFetcher(), web: "筆趣閣", class_: Class(id: 0, name: "首頁"), bookId: UUID(), open: .constant(true))
        }
    }
}
