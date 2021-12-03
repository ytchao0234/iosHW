//
//  SearchBarView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import SwiftUI

struct SearchBarView: View {
    @StateObject var searchViewModel: SearchViewModel
    @StateObject var optionViewModel: OptionViewModel
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(optionViewModel.background.color, lineWidth: 5)
                    .frame(height: 40)
                    .background(optionViewModel.background.color.brightness(-0.4))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary, lineWidth: 0.5)
                    )
                
                if searchViewModel.searchItem.text.isEmpty {
                    Text("Search...")
                        .lineLimit(1)
                        .foregroundColor(optionViewModel.background.color)
                        .opacity(0.5)
                        .padding(7)
                        .padding(.horizontal, 35)
                }
                    
                TextField("", text: $searchViewModel.searchItem.text)
                    .foregroundColor(optionViewModel.background.color)
                    .padding(7)
                    .padding(.horizontal, 35)
                    .onTapGesture {
                        searchViewModel.searchItem.isEditing = true
                    }
                    .focused($isFocused)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(optionViewModel.background.color)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    if searchViewModel.searchItem.isEditing {
                        Button(action: {
                            searchViewModel.searchItem.text = ""
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(optionViewModel.background.color)
                                .padding(.trailing)
                        }
                    }
                }
            }
            
            if searchViewModel.searchItem.isEditing {
                Button(action: {
                    self.isFocused = false
                    searchViewModel.searchItem.isEditing = false
                    searchViewModel.searchItem.text = ""
                }) {
                    Text("Cancel")
                }
                .padding(.trailing)
                .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
        .animation(.easeInOut(duration: 0.5), value: searchViewModel.searchItem.isEditing)
    }
}


struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchViewModel: SearchViewModel(), optionViewModel: OptionViewModel())
    }
}
