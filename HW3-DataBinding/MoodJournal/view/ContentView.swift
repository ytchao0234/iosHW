//
//  ContentView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/16.
//

import SwiftUI

struct ContentView: View {
    @StateObject var searchViewModel = SearchViewModel()
    @StateObject var journalViewModel = JournalViewModel()
    @StateObject var optionViewModel = OptionViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        let columns = [GridItem(.adaptive(minimum: 140, maximum: 400), spacing: 10)]
        
        return NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .bottomTrailing) {
                    VStack{
                        Image(Background.themeList[optionViewModel.background.theme])
                            .resizable()
                            .scaledToFit()
                            .frame(height: 70)
                        VStack {
                            SearchView(
                                searchViewModel: searchViewModel,
                                optionViewModel: optionViewModel
                            )
                                .padding()
                            
                            ScrollView(.vertical) {
                                ForEach(
                                    searchViewModel
                                        .getFilterItems(dict: journalViewModel.journals).keys.sorted(by: journalViewModel.sortTag)
                                    , id: \.self)
                                { tag in

                                    Section(header: Text(tag)) {
                                        LazyVGrid(columns: columns) {
                                            ForEach(
                                                searchViewModel
                                                    .getFilterItems(dict: journalViewModel.journals)[tag]!.values.sorted(by: >))
                                            { journal in

                                                JournalBlockButton(
                                                    journalViewModel: journalViewModel,
                                                    optionViewModel: optionViewModel,
                                                    tag: tag,
                                                    journal: journal
                                                )

                                            }
                                        }
                                    }

                                }
                            }
                            .padding(.horizontal)
                        }
                        .background(optionViewModel.background.color.brightness(-0.12))
                        .cornerRadius(20)
                    }

                    optionButtonView(
                        journalViewModel: journalViewModel,
                        optionViewModel: optionViewModel
                    )
                }
                .frame(
                    width: geometry.size.width * 0.9,
                    height: geometry.size.height * 0.95,
                    alignment: .bottomTrailing
                )
                .padding()
                .background(
                    readAndEditNavLinks(
                        journalViewModel: journalViewModel,
                        optionViewModel: optionViewModel
                ))
            }
            .background(optionViewModel.background.color)
            .onAppear {
                optionViewModel.playBGM()
                journalViewModel.updateJournal()
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

