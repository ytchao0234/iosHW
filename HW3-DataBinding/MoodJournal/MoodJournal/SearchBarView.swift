//
//  SearchBarView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/28.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    @State var isEditing: Bool = false
    
    var body: some View {
        HStack {
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 35)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .onTapGesture {
                    self.isEditing = true
                }
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing)
                            }
                        }
                    }
                )
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                }) {
                    Text("Cancel")
                }
                .padding(.trailing)
                .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
        .animation(.easeInOut(duration: 0.5), value: isEditing)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    @State static var text: String = ""
    
    static var previews: some View {
        SearchBarView(text: $text)
    }
}

extension SearchBarView {
    static func getFilterItems(
        searchText: String,
        dict: [String: [UUID: Journal]]
    ) -> [String: [UUID: Journal]]
    {
        if searchText.isEmpty {
            return dict
        }
        else {
            var result = dict
            
            result.forEach { (key, value) in
                result[key] = result[key]!.filter({
                    return $0.value.title.contains(searchText)
                })
                
                if result[key]!.isEmpty {
                    result.removeValue(forKey: key)
                }
            }
            
            return result
        }
    }
}
