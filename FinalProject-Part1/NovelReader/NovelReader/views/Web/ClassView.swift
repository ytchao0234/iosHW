//
//  ClassView.swift
//  NovelReader
//
//  Created by User06 on 2021/12/25.
//

import SwiftUI

struct ClassView: View {
    @ObservedObject var webNovelFetcher: WebNovelFetcher
    let web: String

    var body: some View {
        List {
            ForEach(webNovelFetcher.classList, id: \.self) { class_ in
                NavigationLink(
                    destination: BookView(webNovelFetcher: webNovelFetcher, web: web, class_: class_),
                    label: {
                        Text(class_)
                    })
            }
            .frame(height: 50)
        }
        .navigationTitle("分類列表")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if webNovelFetcher.classList.isEmpty {
                webNovelFetcher.previewClassList()
            }
        }
    }
}

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClassView(webNovelFetcher: WebNovelFetcher(), web: "筆趣閣")
        }
    }
}
