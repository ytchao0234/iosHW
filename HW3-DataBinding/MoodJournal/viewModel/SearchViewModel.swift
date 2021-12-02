//
//  SearchViewModel.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import Combine
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var searchItem = SearchItem()
    
    func getFilterItems(dict: [String: [UUID: Journal]]) -> [String: [UUID: Journal]]
    {
        var result = dict
        let dateRange = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: searchItem.startDate)!...Calendar.current.date(bySettingHour: 23, minute: 59, second: 59, of: searchItem.endDate)!
        
        result.forEach { (key, value) in
            
            result[key] = result[key]!.filter({
                
                var isContain = true
                
                if !searchItem.text.isEmpty {
                    isContain = isContain && $0.value.title.contains(searchItem.text)
                }
                
                if searchItem.isPickingDate {
                    isContain = isContain && dateRange.contains($0.value.time)
                }
                
                return isContain
            })
            
            if result[key]!.isEmpty {
                result.removeValue(forKey: key)
            }
        }
        
        return result
    }
}
