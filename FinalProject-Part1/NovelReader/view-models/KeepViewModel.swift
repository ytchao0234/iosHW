//
//  KeepViewModel.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/5.
//

import SwiftUI
import CoreData

class KeepViewModel: ObservableObject {
    @Published var selection = Int(0)
    let selectionMenu: [String] = ["最近閱讀", "我的收藏"]
    @Published var current: Novel? = nil
    @Published var lastKeep: Novel? = nil
    @Published var keep: Novel? = nil
    
}
