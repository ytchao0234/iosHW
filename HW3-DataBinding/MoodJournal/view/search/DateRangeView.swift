//
//  DateRangeView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import SwiftUI

struct DateRangeView: View {
    @StateObject var searchViewModel: SearchViewModel
    @StateObject var optionViewModel: OptionViewModel
    
    var body: some View {
        Toggle(isOn: $searchViewModel
                         .searchItem
                         .isPickingDate
        ) {
            Text("選擇日期區間")
                .modifier(FormFactorModifier(color: optionViewModel.background.color))
        }
        
        if searchViewModel.searchItem.isPickingDate {
            DatePicker(
               selection: $searchViewModel
                              .searchItem
                              .startDate,
               in: ...searchViewModel
                          .searchItem
                          .endDate,
               displayedComponents: .date
            ) {
                Text("起始日期")
                    .modifier(FormFactorModifier(color: optionViewModel.background.color))
            }
            DatePicker(
               selection: $searchViewModel
                              .searchItem
                              .endDate,
               in: searchViewModel
                      .searchItem
                      .startDate...Date(),
               displayedComponents: .date
            ) {
                Text("結束日期")
                    .modifier(FormFactorModifier(color: optionViewModel.background.color))
            }
        }
    }
}

struct DateRangeView_Previews: PreviewProvider {
    static var previews: some View {
        DateRangeView(
            searchViewModel: SearchViewModel(),
            optionViewModel: OptionViewModel()
        )
    }
}

