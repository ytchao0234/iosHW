//
//  DateRangeView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import SwiftUI

struct DateRangeView: View {
    @StateObject var searchViewModel: SearchViewModel
    
    var body: some View {
        Toggle("選擇日期區間",
               isOn: $searchViewModel
                         .searchItem
                         .isPickingDate
        )
        
        if searchViewModel.searchItem.isPickingDate {
            DatePicker("起始日期",
                       selection: $searchViewModel
                                      .searchItem
                                      .startDate,
                       in: ...searchViewModel
                                  .searchItem
                                  .endDate,
                       displayedComponents: .date
            )
            DatePicker("結束日期",
                       selection: $searchViewModel
                                      .searchItem
                                      .endDate,
                       in: searchViewModel
                              .searchItem
                              .startDate...Date(),
                       displayedComponents: .date
            )
        }
    }
}

struct DateRangeView_Previews: PreviewProvider {
    static var previews: some View {
        DateRangeView(searchViewModel: SearchViewModel())
    }
}
