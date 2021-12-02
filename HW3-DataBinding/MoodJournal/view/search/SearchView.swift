//
//  SearchBarView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/28.
//

import SwiftUI

struct SearchView: View {
    @StateObject var searchViewModel: SearchViewModel
    @StateObject var optionViewModel: OptionViewModel
    
    var body: some View {
        VStack {
            SearchBarView(
                searchViewModel: searchViewModel,
                optionViewModel: optionViewModel
            )
            
            DisclosureGroup("其他搜尋條件") {
                Group {
                    DateRangeView(
                        searchViewModel: searchViewModel,
                        optionViewModel: optionViewModel
                    )
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(
            searchViewModel: SearchViewModel(),
            optionViewModel: OptionViewModel()
        )
    }
}
