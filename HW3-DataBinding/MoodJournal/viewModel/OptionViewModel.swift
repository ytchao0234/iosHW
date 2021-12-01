//
//  OptionViewModel.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import Combine

class OptionViewModel: ObservableObject {
    @Published var background = Background()
    @Published var showOptions: Bool = false
    @Published var showAlert: Bool = false
    @Published var showSettings: Bool = false
}
