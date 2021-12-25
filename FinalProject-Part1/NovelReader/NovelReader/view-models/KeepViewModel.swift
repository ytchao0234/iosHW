//
//  KeepViewModel.swift
//  NovelReader
//
//  Created by FanRende on 2021/12/25.
//

import SwiftUI

class KeepViewModel: ObservableObject {
    @Published var novels = [Novel]()
}
