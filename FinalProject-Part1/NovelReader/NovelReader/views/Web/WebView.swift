//
//  WebView.swift
//  NovelReader
//
//  Created by User06 on 2021/12/25.
//

import SwiftUI

struct WebView: View {
    @ObservedObject var webNovelFetcher: WebNovelFetcher

    var body: some View {
        NavigationView {
            List {
                ForEach(webNovelFetcher.webList, id: \.self) { web in
                    NavigationLink(
                        destination: ClassView(webNovelFetcher: webNovelFetcher, web: web),
                        label: {
                            Text(web)
                        })
                }
                .frame(height: 50)
            }
            .navigationTitle("網站列表")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            if webNovelFetcher.webList.isEmpty {
                webNovelFetcher.previewWebList()
            }
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(webNovelFetcher: WebNovelFetcher())
    }
}
