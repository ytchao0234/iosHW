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
            
            DisclosureGroup {
                Group {
                    DateRangeView(
                        searchViewModel: searchViewModel,
                        optionViewModel: optionViewModel
                    )
                }
                .padding(.horizontal)
            } label: {
                Label("其他搜尋條件", systemImage: "slider.horizontal.3")
                    .foregroundColor(.secondary)
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
