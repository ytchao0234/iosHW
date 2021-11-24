//
//  Journal.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/23.
//

import Foundation

struct Journal: Identifiable, Codable, Comparable {
    var id = UUID()
    
    var title: String
    var content: String
    var time: Date
    
    static func < (lhs: Journal, rhs: Journal) -> Bool {
        return lhs.time < rhs.time
    }
}

extension Journal {
    static let defaultJournal = Journal(title: "aaa", content: "a", time: Date())
    static let test1 = Journal(title: "bbb", content: "b", time: Date())
    static let test2 = Journal(title: "ccc", content: "c", time: Date())
    static let test3 = Journal(title: "ddd", content: "d", time: Date())
    static let test4 = Journal(title: "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee", content: "e", time: Date())
    
    static let defaultDict = [defaultJournal.id: defaultJournal,
                              test1.id: test1,
                              test2.id: test2,
                              test3.id: test3,
                              test4.id: test4]
    
    static let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let fileName = "records"
    
    static let pathURL = documentDirectory.appendingPathComponent(fileName)
    
    static func saveJournalDict(records: [UUID: Journal]) {
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode(records) {
            try? data.write(to: pathURL)
        }
    }
    
    static func readJournalDict() -> [UUID: Journal]? {
        let decoder = JSONDecoder()
        
        if let data = try? Data(contentsOf: pathURL), let records = try? decoder.decode([UUID: Journal].self, from: data) {
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
}
