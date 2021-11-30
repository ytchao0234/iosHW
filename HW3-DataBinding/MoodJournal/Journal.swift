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
    
    var title: String
    var content: String
    var time: Date
    var fontSize: CGFloat
    var fontFamily: Int
    var moodTag: Int
    
    static func < (lhs: Journal, rhs: Journal) -> Bool {
        return lhs.time < rhs.time
    }
}

extension Journal {
    static let emptyJournal = Journal(title: "", content: "", time: Date(), fontSize: 26, fontFamily: 0, moodTag: 0)
    static let test1 = Journal(title: "bbb嗨嗨", content: "b測試字型", time: Date(), fontSize: 26, fontFamily: 0, moodTag: 0)
    static let test2 = Journal(title: "ccc哈囉", content: "c你好嗎", time: Date(), fontSize: 26, fontFamily: 0, moodTag: 0)
    static let test3 = Journal(title: "ddd衷心感謝", content: "d珍重再見", time: Date(), fontSize: 26, fontFamily: 0, moodTag: 0)
    static let test4 = Journal(title: "期待再相逢eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee", content: "e耶", time: Date(), fontSize: 26, fontFamily: 0, moodTag: 0)
    
    static let defaultDict = ["無標籤": [test1.id: test1, test2.id: test2],
                              "Aaa": [test3.id: test3, test4.id: test4]]
    
    static let fontFamilyList = ["PingFang TC", "YuMincho", "Yuanti TC", "Klee", "Hannotate TC", "Hanzipen TC", "Xingkai TC"]
    static let moodTagList = ["開心", "難過", "生氣", "尷尬"]
    
    static let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let fileName = "records"
    
    static let pathURL = documentDirectory.appendingPathComponent(fileName)
    
    static func saveJournalDict(records: [String: [UUID: Journal]]) {
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode(records) {
            try? data.write(to: pathURL)
        }
    }
    
    static func readJournalDict() -> [String: [UUID: Journal]]? {
        let decoder = JSONDecoder()
        
        if let data = try? Data(contentsOf: pathURL), let records = try? decoder.decode([String: [UUID: Journal]].self, from: data) {
            return records
        }
        else {
            return nil
        }
    }
    
    static func deleteAll() {
        do {
            try FileManager.default.removeItem(at: pathURL)
        }
        catch {
            print("error: \(error.localizedDescription)")
        }
    }
    
    func isEmpty() -> Bool {
        if self.title == "" && self.content == "" {
            return true
        } else {
            return false
        }
//        let encoder = JSONEncoder()
//
//        do {
//            let selfData = try encoder.encode(self)
//            let emptyData = try encoder.encode(Journal.emptyJournal)
//
//            let selfJson = try JSONSerialization.jsonObject(with: selfData, options: [])
//            let emptyJson = try JSONSerialization.jsonObject(with: emptyData, options: [])
//
//            if var selfDict = selfJson as? [String: Any],
//               var emptydDict = emptyJson as? [String: Any] {
//
//                selfDict.removeValue(forKey: "id")
//                selfDict.removeValue(forKey: "time")
//                emptydDict.removeValue(forKey: "id")
//                emptydDict.removeValue(forKey: "time")
//
//                return NSDictionary(dictionary: selfDict).isEqual(to: emptydDict)
//            } else {
//                print("Cannot convert selfJson or emptyJson as [String: Any]")
//                return false
//            }
//        }
//        catch {
//            print("error: \(error.localizedDescription)")
//            return false
//        }
    }
}
