//
//  ShareView.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/19.
//

import UIKit
import SwiftUI

struct ShareView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIActivityViewController
    let novel: Novel
    var item: String {
        """
        書名：\(novel.book.name)
        作者：\(novel.book.author)
        更新：\(novel.book.state)

        === 小說簡介 ===

        \(novel.book.intro)
        """
    }

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: [item], applicationActivities: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

struct ShareView_Previews: PreviewProvider {
    @State static var isSharePresented: Bool = false

    static var previews: some View {
        Button("Share app") {
            self.isSharePresented = true
        }
        .sheet(isPresented: $isSharePresented, onDismiss: {
            print("Dismiss")
        }, content: {
            ShareView(novel: Novel())
        })
    }
}
