//
//  SearchBarView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/28.
//

import SwiftUI

struct SearchView: View {
    @Binding var text: String
    @Binding var startDate: Date
    @Binding var endDate: Date
    @Binding var isPickingDate: Bool
    
    var body: some View {
        VStack {
            SearchBarView(text: $text)
            
            DisclosureGroup("其他搜尋條件") {
                Group {
                    Toggle("選擇日期區間", isOn: $isPickingDate)
                    
                    if isPickingDate {
                        DatePicker("起始日期", selection: $startDate, in: ...endDate, displayedComponents: .date)
                        DatePicker("結束日期", selection: $endDate, in: startDate...Date(), displayedComponents: .date)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.horizontal)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    @State static var text: String = ""
    @State static var startDate: Date = Date()
    @State static var endDate: Date = Date()
    @State static var isPickingDate: Bool = false
    
    static var previews: some View {
        SearchView(text: $text, startDate: $startDate, endDate: $endDate, isPickingDate: $isPickingDate)
.previewInterfaceOrientation(.portrait)
    }
}

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

extension SearchView {
    static func getFilterItems(
        searchText: String,
        isPickingDate: Bool,
        dateRange: ClosedRange<Date>,
        dict: [String: [UUID: Journal]]
    ) -> [String: [UUID: Journal]]
    {
        var result = dict
        
        result.forEach { (key, value) in
            
            result[key] = result[key]!.filter({
                
                var isContain = true
                
                if !searchText.isEmpty {
                    isContain = isContain && $0.value.title.contains(searchText)
                }
                
                if isPickingDate {
                    isContain = isContain && dateRange.contains($0.value.time)
                    
                    print("isContain: \(dateRange.contains($0.value.time))")
                    print("dateRange: \(dateRange)")
                    print("$0.value.time: \($0.value.time)")
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
