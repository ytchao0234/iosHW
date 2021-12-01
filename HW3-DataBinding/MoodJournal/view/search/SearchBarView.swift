//
//  SearchBarView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import SwiftUI

struct SearchBarView: View {
    @StateObject var searchViewModel: SearchViewModel
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            TextField("Search ...", text: $searchViewModel.searchItem.text)
                .padding(7)
                .padding(.horizontal, 35)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .onTapGesture {
                    searchViewModel.searchItem.isEditing = true
                }
                .focused($isFocused)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        if searchViewModel.searchItem.isEditing {
                            Button(action: {
                                searchViewModel.searchItem.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing)
                            }
                        }
                    }
                )
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
        SearchBarView(searchViewModel: SearchViewModel())
    }
}
