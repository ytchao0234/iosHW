//
//  NovelMenuView.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/12.
//

import SwiftUI

struct NovelMenuView: View {
    @EnvironmentObject var webNovelFetcher: WebNovelFetcher
    let novel: Novel
    @Binding var showMenu: Bool

    var body: some View {
        List {
            if webNovelFetcher.flattenNovelList[novel.id]!.chapter.count > 0 {
                Button {
                    showMenu = false
                    webNovelFetcher.flattenNovelList[novel.id]!.chapter.index = 0
                } label: {
                    Text("簡介")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.7))
                }
                .listRowBackground(
                    ZStack {
                        Rectangle()
                            .stroke(.secondary, lineWidth: 0.3)
                        LeadingBorder(width: 5)
                            .foregroundColor(.accentColor)
                            .opacity(webNovelFetcher.flattenNovelList[novel.id]!.chapter.index == 0 ? 1 : 0)
                    }
                )

                ForEach(1 ..< webNovelFetcher.flattenNovelList[novel.id]!.chapter.count + 1) { index in
                    Button {
                        showMenu = false
                        webNovelFetcher.flattenNovelList[novel.id]!.chapter.index = index
                    } label: {
                        Text( webNovelFetcher.flattenNovelList[novel.id]!.chapter.title[index-1])
                            .font(.caption)
                            .lineLimit(1)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    .listRowBackground(
                        ZStack {
                            Rectangle()
                                .stroke(.secondary, lineWidth: 0.3)
                            LeadingBorder(width: 5)
                                .foregroundColor(.accentColor)
                                .opacity(webNovelFetcher.flattenNovelList[novel.id]!.chapter.index == index ? 1 : 0)
                        }
                    )
                }
            }
        }
        .listStyle(.plain)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.secondary.brightness(-0.7))
        .overlay {
            if webNovelFetcher.flattenNovelList[novel.id]!.chapter.count == 0 {
                ProgressView()
            }
        }
    }
}

struct LeadingBorder: Shape {
    let width: CGFloat
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addPath(Path(CGRect(x: rect.minX, y: rect.minY, width: self.width, height: rect.height)))
        }
    }
}
