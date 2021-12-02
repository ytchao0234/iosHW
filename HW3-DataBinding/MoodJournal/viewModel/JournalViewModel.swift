//
//  JournalViewModel.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import Combine
import SwiftUI

class JournalViewModel: ObservableObject {
//    @Published var journals = [String: [UUID: Journal]]()
    @Published var journals = Journal.defaultDict
    @Published var toEdit = Bool()
    @Published var toRead = Bool()
    @Published var toAddTag = Bool()
    var tag = String()
    var id = UUID()
    var newTag = String()
    
    func createJournal() {
        let newJournal = Journal()

        if journals["無標籤"] == nil {
            journals["無標籤"] = [newJournal.id: newJournal]
        }
        else {
            journals["無標籤"]![newJournal.id] = newJournal
        }
        
        toEdit = true
        tag = "無標籤"
        id = newJournal.id
    }
    
    func deleteJournal() {
        journals[tag]!.removeValue(forKey: id)
        
        if NSDictionary(dictionary: journals[tag]!).isEqual(to: [:]) {
            journals.removeValue(forKey: tag)
        }
    }
    
    let pathURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                      .appendingPathComponent("records")
    
    func saveJournals() {
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode(journals) {
            try? data.write(to: pathURL)
        }
    }
    
    func getJournals() -> [String: [UUID: Journal]]? {
        let decoder = JSONDecoder()
        
        if let data = try? Data(contentsOf: pathURL), let records = try? decoder.decode([String: [UUID: Journal]].self, from: data) {
            return records
        }
        else {
            return nil
        }
    }
    
    func deleteAllJournals() {
        journals.removeAll()
        
        do {
            try FileManager.default.removeItem(at: pathURL)
        }
        catch {
            print("error: \(error.localizedDescription)")
        }
    }
    
    func setTag() {
        if let journalsTag = journals[tag],
           let journal = journalsTag[id],
           !journal.isEmpty()
        {
            let key = journals.keys.sorted(by: sortTag)[journals[tag]![id]!.moodTag]
            
            if toAddTag &&
               newTag != tag &&
               newTag.count > 0
            {
                
                if journals[newTag] == nil {
                   journals[newTag] = [id: journal]
                } else {
                    journals[newTag]![id] = journal
                }
                
                deleteJournal()
                tag = newTag
                
                journals[newTag]![id]!.moodTag = journals.keys.sorted(by: sortTag).firstIndex(where: {$0 == newTag})!
            }
            else if !toAddTag && key != tag {
                
                journals[key]![id] = journal
                
                deleteJournal()
                tag = key
                
                journals[key]![id]!.moodTag = journals.keys.sorted(by: sortTag).firstIndex(where: {$0 == key})!
            }
        }
    }
    
    func sortTag(lhs: String, rhs: String) -> Bool {
        if lhs == "無標籤" {
            return true
        }
        else if rhs == "無標籤" {
            return false
        }
        else {
            return lhs < rhs
        }
    }
    
    func clearEmptyJournal() {
        if let journalsTag = journals[tag],
           let journal = journalsTag[id],
           journal.isEmpty()
        {
            journals[tag]!.removeValue(forKey: id)

            if NSDictionary(dictionary: journals[tag]!)
                .isEqual(to: [:])
            {
                journals.removeValue(forKey: tag)
            }
        }
        
    }
}
