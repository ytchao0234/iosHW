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
    @Published var newTag = String()
    var tag = String()
    var id = UUID()
    
    init() {
//        self.journals = getJournals() ?? [String: [UUID: Journal]]()
    }
    
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
    
    func updateJournal() {
        if let journalsTag = journals[tag],
           let journal = journalsTag[id]
        {
            journals[tag]![id]!.time = Date()
            
            if journal.isEmpty() {
                deleteJournal()
            }
            else {
                
                let key = journals.keys.sorted(by: sortTag)[journals[tag]![id]!.moodTag]
                
                if toAddTag && newTag != tag && newTag.count > 0 {
                    setTag(journal, key: newTag)
                }
                else if !toAddTag && key != tag {
                    setTag(journal, key: key)
                }
            }
            
            toAddTag = false
            newTag = ""
            saveJournals()
        }
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
    
    func setTag(_ journal: Journal, key: String) {
        if journals[key] == nil {
           journals[key] = [id: journal]
        } else {
            journals[key]![id] = journal
        }
        
        deleteJournal()
        journals[key]![id]!.moodTag = journals.keys.sorted(by: sortTag).firstIndex(where: {$0 == key})!
        
        tag = key
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
}
