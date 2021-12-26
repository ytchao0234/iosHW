//
//  CommantEditView.swift
//  NovelReader
//
//  Created by FanRende on 2021/12/26.
//

import SwiftUI
import SwiftDown

@available(iOS 15.0, *)
struct CommantEditView: View {
    @Binding var text: String
    @FocusState.Binding var focus: Bool

    var body: some View {
        ZStack(alignment: .topLeading) {
            SwiftDownEditor(text: $text)
                .insetsSize(20)
                .theme(Theme.BuiltIn.defaultDark.theme())
                .focused($focus)

            if text.isEmpty && !focus {
                Text("請輸入評論...")
                    .padding(.vertical, 16)
                    .padding(.horizontal, 26)
                    .foregroundColor(Color.white.opacity(0.4))
            }
        }
    }
}
