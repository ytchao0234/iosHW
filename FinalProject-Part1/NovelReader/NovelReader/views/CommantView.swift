//
//  CommantView.swift
//  NovelReader
//
//  Created by FanRende on 2021/12/25.
//

import SwiftUI
import SwiftDown

struct CommantView: View {
    @State var text = String("# H1\n[google](https://www.google.com)")

    var body: some View {
        VStack {
            SwiftDownEditor(text: $text)
                .insetsSize(20)
        }
    }
}

struct CommantView_Previews: PreviewProvider {
    static var previews: some View {
        CommantView()
    }
}
