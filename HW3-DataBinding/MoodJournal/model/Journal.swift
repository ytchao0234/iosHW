//
//  Journal.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/23.
//

import SwiftUI
import Foundation

struct Journal: Identifiable, Codable, Comparable {
    var id = UUID()
    
    var title = String()
    var content = String()
    var time = Date()
    var fontSize: CGFloat = 22
    var fontFamily = Int()
    var moodTag = Int()
    
    static func < (lhs: Journal, rhs: Journal) -> Bool {
        return lhs.time < rhs.time
    }
    
    func isEmpty() -> Bool {
        if self.title == "" && self.content == "" {
            return true
        } else {
            return false
        }
    }
}

extension Journal {
    static let emptyJournal = Journal(title: "", content: "", time: Date(), fontSize: 22, fontFamily: 0, moodTag: 0)
    static let test1 = Journal(title: "bbb嗨嗨", content: "b測試字型", time: Date(), fontSize: 22, fontFamily: 0, moodTag: 0)
    static let test2 = Journal(title: "ccc哈囉", content: "c你好嗎", time: Date(), fontSize: 22, fontFamily: 0, moodTag: 0)
    static let test3 = Journal(title: "ddd衷心感謝", content: "d珍重再見", time: Date(), fontSize: 22, fontFamily: 0, moodTag: 0)
    static let test4 = Journal(title: "期待再相逢eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee", content: "e耶", time: Date(), fontSize: 22, fontFamily: 0, moodTag: 0)
    
    static let defaultDict = ["無標籤": [test1.id: test1, test2.id: test2],
                              "Aaa": [test3.id: test3, test4.id: test4]]
    
    static let fontFamilyList = ["PingFang TC", "YuMincho", "Yuanti TC", "Klee", "Hannotate TC", "Hanzipen TC", "Xingkai TC"]
    static let moodTagList = ["開心", "難過", "生氣", "尷尬"]
}
