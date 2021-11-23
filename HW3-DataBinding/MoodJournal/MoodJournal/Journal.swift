//
//  Journal.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/23.
//

import Foundation

struct Journal: Codable {
    var title: String
    var content: String
    var time: Date
}

extension Journal {
    static let defaultJournal = Journal(title: "hhh", content: "aaa", time: Date())
    
    static let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let fileName = "records"
    
    static let pathURL = documentDirectory.appendingPathComponent(fileName)
    
    static func saveJournalList(records: [Journal]) {
        let propertyListEncoder = PropertyListEncoder()
        
        if let data = try? propertyListEncoder.encode(records) {
            try? data.write(to: pathURL)
        }
    }
    
    static func readJournalList() -> [Journal]? {
        let propertyListDecoder = PropertyListDecoder()
        
        if let data = try? Data(contentsOf: pathURL), let records = try? propertyListDecoder.decode([Journal].self, from: data) {
            return records
        }
        else {
            return nil
        }
    }
}
