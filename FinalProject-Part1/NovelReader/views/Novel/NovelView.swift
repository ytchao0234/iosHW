//
//  NovelView.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/11.
//

import SwiftUI

struct NovelView: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    let novel: Novel
    @Binding var showNovel: Bool
    @State var showMenu: Bool = false

    var body: some View {
        let selection = Binding<Int> {
            if let novel = webNovelFetcher.flattenNovelList[novel.id] {
                return novel.chapter.index
            }
            else {
                return 0
            }
        } set: {
            if webNovelFetcher.flattenNovelList[novel.id] != nil {
                webNovelFetcher.flattenNovelList[novel.id]!.chapter.index = $0
            }
        }

        return GeometryReader { geometry in
            ZStack(alignment: .leading) {
                NovelMenuView(novel: novel)
                    .frame(width: geometry.size.width * 0.6)
                Group {
                    if webNovelFetcher.flattenNovelList[novel.id]!.chapter.count > 0 {
                        TabView(selection: selection) {
                            NovelIntroView(novel: webNovelFetcher.flattenNovelList[novel.id]!, width: geometry.size.width, height: geometry.size.height)
                                .tag(0)
                            ForEach(1..<webNovelFetcher.flattenNovelList[novel.id]!.chapter.count+1) { index in
                                NovelContentView(novel: novel, index: index-1, width: geometry.size.width)
                                    .tag(index)
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                    }
                    else {
                        ProgressView()
                            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    }
                }
                .offset(x: showMenu ? geometry.size.width * 0.6: 0)
                .animation(.linear(duration: 0.2), value: showMenu)
                NovelSettingView(novel: webNovelFetcher.flattenNovelList[novel.id]!, width: geometry.size.width, height: geometry.size.height, showNovel: $showNovel, showMenu: $showMenu)
            }
        }
        .onAppear {
            if webNovelFetcher.flattenNovelList[novel.id]!.chapter.count == 0 {
                webNovelFetcher.getChapterList(novel: novel)
            }
        }
    }
}

struct NovelView_Previews: PreviewProvider {
    static var previews: some View {
        NovelView(novel: Novel(), showNovel: .constant(true))
    }
}

struct NovelSettingView: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    let novel: Novel
    let width: Double
    let height: Double
    @Binding var showNovel: Bool
    @Binding var showMenu: Bool

    var body: some View {
        ZStack {
            VStack {
                ZStack(alignment: .bottom) {
                    Color.black.brightness(0.15)
                        .frame(height: height * 0.1)
                    
                    HStack {
                        Button {
                            showNovel = false
                        } label: {
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white.opacity(0.7))
                                .frame(width: 20, height: 20)
                                .padding()
                        }
                        Spacer()
                    }
                }
                Spacer()
                HStack {
                    Button {
                        showMenu.toggle()
                    } label: {
//                        ZStack {
                            Image(systemName: "list.bullet")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white.opacity(0.7))
                                .padding(5)
                                .frame(width: 30, height: 60)
                                .background(Color.black.brightness(0.15).clipShape(HalfCircle()))
//                        }
                    }
                    .offset(x: showMenu ? width * 0.6: 0)
                    .animation(.linear(duration: 0.2), value: showMenu)
                    Spacer()
                }
                Spacer()
                Color.black.brightness(0.15)
                    .frame(height: height * 0.1)
            }
        }
        .ignoresSafeArea()
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
