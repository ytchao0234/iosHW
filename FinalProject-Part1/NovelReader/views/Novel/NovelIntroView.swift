//
//  NovelIntroView.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/12.
//

import SwiftUI
import SwiftDown

struct NovelIntroView: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    let novel: Novel
    let width: Double
    let height: Double
    @Binding var showSetting: Bool
    @State var openCommantView: Bool = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView(.vertical, showsIndicators: false) {
                IntroBlockView(novel: novel, imageWidth: width*0.3, imageHeight: height*0.3, showSetting: $showSetting)
                CommantListView(novel: novel)
            }
            Button {
                openCommantView = true
            } label: {
                Color.accentColor
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay(Image(systemName: "square.and.pencil")
                                .resizable()
                                .scaledToFit()
                                .font(.body.weight(.bold))
                                .scaleEffect(0.5)
                                .foregroundColor(.white))
            }
            .padding()
            .sheet(isPresented: $openCommantView) {
                CommantEditView(novel: novel, width: width, toOpen: $openCommantView)
            }

        }
        .padding(.horizontal)
    }
}

struct IntroBlockView: View {
    @EnvironmentObject var backgroundViewModel: BackgroundViewModel
    let novel: Novel
    let imageWidth: Double
    let imageHeight: Double
    @Binding var showSetting: Bool

    var body: some View {
        VStack {
            HStack {
                ImageAndRating(novel: novel, imageWidth: imageWidth, imageHeight: imageHeight)

                InfoView(novel: novel, showSetting: $showSetting)
                    .padding(.leading)
            }
            
            Divider()
                .brightness(backgroundViewModel.background.preferredColorScheme == .light ? -0.8 : 0.8)
            
            if novel.book.intro.count > 0 {
                Text(novel.book.intro)
                    .padding(.vertical)
            } else {
                Text("-- 此書無簡介 --")
                    .foregroundColor(.secondary.opacity(0.7))
                    .padding(.vertical, 80)
            }
        }
    }
}

struct ImageAndRating: View {
    let novel: Novel
    let imageWidth: Double
    let imageHeight: Double

    var body: some View {
        VStack {
            Spacer()
            AsyncImage(url: URL(string: novel.book.imageLink)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
                    .frame(width: imageWidth, height: imageHeight*0.7)
                    .background(Color.secondary.opacity(0.2))
            }
            Spacer()
            
            VStack {
                RatingView(rating: .constant(novel.rating))
                    .disabled(true)
                Text(String(format: "%.1f(%d)", novel.rating.amount, novel.rating.number))
                    .font(.caption2)
            }
            .padding(.horizontal)
        }
        .frame(width: imageWidth, height: imageHeight)
    }
}

struct InfoView: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    let novel: Novel
    @Binding var showSetting: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Text(novel.book.name)
                .font(.title)

            Group {
                Text("作者\t\t: \(novel.book.author)")
                    .padding(.top, 5)
                Text("更新狀態\t: \(novel.book.state)")
                Text("章節數\t: \(novel.chapter.count)")
            }
            .font(.caption)
            .foregroundColor(.secondary)
            
            Spacer()
            Button {
                showSetting.toggle()
                webNovelFetcher.flattenNovelList[novel.id]!.chapter.index = 1
            } label: {
                Label("開始閱讀", systemImage: "book")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.bottom, 5)
        }
    }
}

struct CommantListView: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    @EnvironmentObject var backgroundViewModel: BackgroundViewModel
    let novel: Novel

    var body: some View {
        if webNovelFetcher.flattenNovelList[novel.id]!.commants.count > 0 {
            LazyVStack(alignment: .leading) {
                ForEach(webNovelFetcher.flattenNovelList[novel.id]!.commants) { commant in
                    Divider()
                        .brightness(backgroundViewModel.background.preferredColorScheme == .light ? -0.8 : 0.8)

                    VStack(alignment: .leading) {
                        RatingView(rating: .constant(Rating(amount: Double(commant.rating), number: 1)))
                            .disabled(true)
                            .frame(width: 60)
                        Text(LocalizedStringKey(commant.content))
                    }
                    .padding(.vertical)
                }
            }
        } else {
            Divider()
                .brightness(backgroundViewModel.background.preferredColorScheme == .light ? -0.8 : 0.8)

            Text("-- 還沒有評論 --")
                .foregroundColor(.secondary.opacity(0.7))
                .padding(.vertical, 80)
        }
    }
}

struct CommantEditView: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    let novel: Novel
    let width: Double
    @Binding var toOpen: Bool
    @FocusState var focus: Bool
    @State private var toAlert: Bool = false

    var body: some View {
        let commantIndex = novel.commants.firstIndex {
            $0.id == novel.commant.id
        }
        let text = Binding<String> {
            if let novel = webNovelFetcher.flattenNovelList[novel.id] {
                return novel.commant.content
            }
            else {
                return String()
            }
        } set: {
            if webNovelFetcher.flattenNovelList[novel.id] != nil {
                webNovelFetcher.flattenNovelList[novel.id]!.commant.content = $0
            }
        }
        let rating = Binding<Rating> {
            if let novel = webNovelFetcher.flattenNovelList[novel.id] {
                return Rating(amount: Double(novel.commant.rating), number: 1)
            }
            else {
                return Rating()
            }
        } set: {
            if webNovelFetcher.flattenNovelList[novel.id] != nil {
                webNovelFetcher.flattenNovelList[novel.id]!.commant.rating = Int($0.amount)
            }
        }
        return VStack {
            HStack {
                Button("取消") {
                    toOpen = false
                }
                Spacer()
                Text("撰寫評論")
                Spacer()
                Button("送出") {
                    if let novel = webNovelFetcher.flattenNovelList[novel.id] {
                        if novel.commant.rating == 0 || novel.commant.content.isEmpty {
                            toAlert = true
                        }
                        else {
                            let originRating = webNovelFetcher.flattenNovelList[novel.id]!.rating
                            let addingRating = Rating(amount: Double(webNovelFetcher.flattenNovelList[novel.id]!.commant.rating), number: 1)
                            webNovelFetcher.flattenNovelList[novel.id]!.rating = Rating(
                                amount: (originRating.amount*Double(originRating.number)+addingRating.amount)/Double(originRating.number+addingRating.number),
                                number: originRating.number+addingRating.number
                            )

                            if let index = commantIndex {
                                webNovelFetcher.flattenNovelList[novel.id]!.commants[index] = novel.commant
                            }
                            else {
                                webNovelFetcher.flattenNovelList[novel.id]!.commants.append(novel.commant)
                            }
                            webNovelFetcher.setRatingAndCommant(novel: webNovelFetcher.flattenNovelList[novel.id]!)
                            toOpen = false
                        }
                    }
                }
                .alert("評論未完成！", isPresented: $toAlert, actions: {
                    Button("取消", role: .cancel) {}
                    Button("仍要送出", role: .destructive) {
                        if let index = commantIndex {
                            let originRating = webNovelFetcher.flattenNovelList[novel.id]!.rating
                            let removingRating = Rating(amount: Double( webNovelFetcher.flattenNovelList[novel.id]!.commants[index].rating), number: 1)
                            webNovelFetcher.flattenNovelList[novel.id]!.rating = Rating(
                                amount: Double(originRating.number-removingRating.number) > 0 ?  (originRating.amount*Double(originRating.number)-removingRating.amount)/Double(originRating.number-removingRating.number) : 0,
                                number: originRating.number-removingRating.number
                            )
                            webNovelFetcher.flattenNovelList[novel.id]!.commants.remove(at: index)
                            webNovelFetcher.setRatingAndCommant(novel: webNovelFetcher.flattenNovelList[novel.id]!)
                        }
                        toOpen = false
                    }
                }, message: {
                    Text("因未給予評分或評論\n將視為刪除評論\n確定要送出嗎？")
                })
            }
            .padding()

            RatingView(rating: rating)
                .frame(width: 150)
                .padding()

            ScrollView(.vertical, showsIndicators: false) {
                Text(LocalizedStringKey(text.wrappedValue))
                    .padding()
                    .frame(width: width, alignment: .topLeading)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.yellow.opacity(0.3))
            .onTapGesture {
                focus = false
            }

            Divider()
            ZStack(alignment: .topLeading) {
                SwiftDownEditor(text: text)
                    .insetsSize(20)
                    .theme(Theme.BuiltIn.defaultDark.theme())
                    .focused($focus)

                if text.wrappedValue.isEmpty && !focus {
                    Text("請輸入評論...")
                        .padding(.vertical, 16)
                        .padding(.horizontal, 26)
                        .foregroundColor(Color.white.opacity(0.4))
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
