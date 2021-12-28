//
//  ClassView.swift
//  NovelReader
//
//  Created by User06 on 2021/12/25.
//

import SwiftUI

@available(iOS 15.0, *)
struct ClassView: View {
    @ObservedObject var webNovelFetcher: WebNovelFetcher
    let web: String

    var body: some View {
        List {
            ForEach(webNovelFetcher.novelList[web]!.keys.sorted(by: <), id: \.self) { class_ in
                NavigationLink(
                    destination: BookView(webNovelFetcher: webNovelFetcher, web: web, class_: class_),
                    label: {
                        Text(class_.name)
                    })
            }
            .frame(height: 50)
        }
        .overlay {
            if let webContent = webNovelFetcher.novelList[web],
               webContent.isEmpty {
                ProgressView()
            }
        }
        .refreshable {
            webNovelFetcher.getClassList(web: web)
        }
        .alert("獲取資料失敗", isPresented: $webNovelFetcher.fetchFailed, actions: {
            Button("確定") {}
        }, message: {
            Text("沒有網路連線")
        })
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text("分類列表")
            }
        })
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if let webContent = webNovelFetcher.novelList[web],
               webContent.isEmpty {
                webNovelFetcher.getClassList(web: web)
            }
        }
    }
}

@available(iOS 15.0, *)
struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClassView(webNovelFetcher: WebNovelFetcher(), web: "筆趣閣")
        }
    }
}
