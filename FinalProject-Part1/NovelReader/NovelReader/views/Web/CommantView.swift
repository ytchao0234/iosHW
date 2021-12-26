//
//  CommantView.swift
//  NovelReader
//
//  Created by FanRende on 2021/12/26.
//

import SwiftUI

@available(iOS 15.0, *)
struct CommantView: View {
    @Binding var text: String
    @FocusState var focus: Bool

    var body: some View {
        VStack {
            RatingView()
                .padding()
            CommantReadView(text: $text)
                .padding()
                .background(Color.yellow.opacity(0.3))
            ZStack {
                CommantEditView(text: $text, focus: $focus)
            }
        }
        .padding(.vertical)
        .onTapGesture {
            focus = false
        }
        .navigationTitle("撰寫評論")
        .navigationBarTitleDisplayMode(.inline)
    }
}

@available(iOS 15.0, *)
struct CommantView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommantView(text: .constant("# H1\n## H2\n### H3\nplain text"))
        }
    }
}
