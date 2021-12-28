//
//  WebView.swift
//  NovelReader
//
//  Created by User06 on 2021/12/25.
//

import SwiftUI

@available(iOS 15.0, *)
struct WebView: View {
    @ObservedObject var webNovelFetcher: WebNovelFetcher

    var body: some View {
        NavigationView {
            List {
                ForEach(webNovelFetcher.novelList.keys.sorted(), id: \.self) { web in
                    NavigationLink(
                        destination: ClassView(webNovelFetcher: webNovelFetcher, web: web),
                        label: {
                            Text(web)
                        })
                }
                .frame(height: 50)
            }
            .overlay {
                if webNovelFetcher.novelList.isEmpty {
                    ProgressView()
                }
            }
            .refreshable {
                webNovelFetcher.getWebList()
            }
            .alert("獲取資料失敗", isPresented: $webNovelFetcher.fetchFailed, actions: {
                Button("確定") {}
            }, message: {
                Text("沒有網路連線")
            })
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Text("網站列表")
                }
            })
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            if webNovelFetcher.novelList.isEmpty {
                webNovelFetcher.getWebList()
            }
        }
    }
}

@available(iOS 15.0, *)
struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(webNovelFetcher: WebNovelFetcher())
    }
}
