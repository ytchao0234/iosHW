//
//  NovelView.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/11.
//

import SwiftUI

struct NovelView: View {
    @EnvironmentObject var keepViewModel: KeepViewModel
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    @EnvironmentObject var backgroundViewModel: BackgroundViewModel
    let novel: Novel
    @Binding var showNovel: Bool
    @State var showMenu: Bool = false
    @State var showSetting: Bool = false
    @State var keep: Bool = false

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
                NovelMenuView(novel: novel, showMenu: $showMenu)
                    .frame(width: geometry.size.width * 0.6)
                VStack {
                    Group {
                        if selection.wrappedValue > 0 {
                            Text(webNovelFetcher.flattenNovelList[novel.id]!.chapter.title[selection.wrappedValue-1])
                        }
                        else {
                            Text("簡介")
                        }
                    }
                    .font(.caption2)
                    .padding(.vertical, 5)
                    if webNovelFetcher.flattenNovelList[novel.id]!.chapter.count > 0 {
                        TabView(selection: selection) {
                            NovelIntroView(novel: webNovelFetcher.flattenNovelList[novel.id]!, width: geometry.size.width, height: geometry.size.height, showSetting: $showSetting)
                                .tag(0)
                                .gesture(showMenu || showSetting ? DragGesture()
                                            .onChanged({ _ in
                                    if showMenu {
                                        showMenu = false
                                    }
                                    else {
                                        showSetting.toggle()
                                    }
                                }) : nil)
                            ForEach(1..<webNovelFetcher.flattenNovelList[novel.id]!.chapter.count+1) { index in
                                NovelContentView(novel: novel, index: index-1, width: geometry.size.width)
                                    .tag(index)
                                    .gesture(showMenu || showSetting ? DragGesture()
                                                .onChanged({ _ in
                                        if showMenu {
                                            showMenu = false
                                        }
                                        else {
                                            showSetting.toggle()
                                        }
                                    }) : nil)
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .never))
                    }
                    else {
                        ProgressView()
                            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    }
                }
                .background(backgroundViewModel.background.color)
                .offset(x: showMenu ? geometry.size.width * 0.6: 0)
                .animation(.linear(duration: 0.2), value: showMenu)
                .onTapGesture {
                    if showMenu {
                        showMenu = false
                    }
                    else {
                        showSetting.toggle()
                    }
                }
                
                if showSetting {
                    NovelSettingView(novel: webNovelFetcher.flattenNovelList[novel.id]!, width: geometry.size.width, height: geometry.size.height, showNovel: $showNovel, showMenu: $showMenu, showSetting: $showSetting, keep: $keep)
                }
            }
        }
        .preferredColorScheme(backgroundViewModel.background.preferredColorScheme)
        .alert("獲取資料失敗", isPresented: $webNovelFetcher.fetchFailed, actions: {
            Button("確定") {}
        }, message: {
            Text("請檢查網路連線")
        })
        .onAppear {
            self.keep = webNovelFetcher.flattenNovelList[novel.id]!.keep
            if keep {
                keepViewModel.keep = webNovelFetcher.flattenNovelList[novel.id]!
            }
            if webNovelFetcher.flattenNovelList[novel.id]!.chapter.count == 0 {
                webNovelFetcher.getChapterList(novel: novel)
            }
            if webNovelFetcher.flattenNovelList[novel.id]!.chapter.index == 0 {
                self.showSetting = true
            }
        }
        .onDisappear() {
            webNovelFetcher.flattenNovelList[novel.id]!.readTime = Date()
            keepViewModel.current = webNovelFetcher.flattenNovelList[novel.id]!
            
            webNovelFetcher.flattenNovelList[novel.id]!.keep = self.keep
            if keep {
                keepViewModel.keep = webNovelFetcher.flattenNovelList[novel.id]!
            } else {
                keepViewModel.lastKeep = keepViewModel.keep
                keepViewModel.keep = nil
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
    @EnvironmentObject var keepViewModel: KeepViewModel
    let novel: Novel
    let width: Double
    let height: Double
    @Binding var showNovel: Bool
    @Binding var showMenu: Bool
    @Binding var showSetting: Bool
    @Binding var keep: Bool

    var body: some View {
        ZStack {
            VStack {
                ZStack(alignment: .bottom) {
                    Color.secondary.brightness(-0.7)
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
                        Button {
                            keep.toggle()
                        } label: {
                            Group {
                                if keep {
                                    Image(systemName: "bookmark.fill")
                                        .resizable()
                                        .scaledToFit()
                                } else {
                                    Image(systemName: "bookmark")
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                            .foregroundColor(.yellow)
                            .frame(width: 20, height: 20)
                            .padding()
                        }
                    }
                }
                Spacer()
                HStack {
                    Button {
                        showMenu.toggle()
                        
                        if showMenu {
                            showSetting = false
                        }
                    } label: {
                        Image(systemName: "list.bullet")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white.opacity(0.7))
                            .padding(5)
                            .frame(width: 30, height: 60)
                            .background(Color.secondary.brightness(-0.7).clipShape(HalfCircle()))
                    }
                    .offset(x: showMenu ? width * 0.6: 0)
                    .animation(.linear(duration: 0.2), value: showMenu)
                    Spacer()
                }
                Spacer()
                Color.secondary.brightness(-0.7)
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
