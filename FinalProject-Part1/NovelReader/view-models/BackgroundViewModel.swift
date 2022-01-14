//
//  BackgroundViewModel.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/5.
//

import SwiftUI

class BackgroundViewModel: ObservableObject {
    @Published var background = Background()
    
    func setColor() {
        self.background.lightColor = self.background.color
    }
    
    func toggleColorScheme() {
        if self.background.preferredColorScheme == .light {
            self.background.preferredColorScheme = .dark
            self.background.lightColor = self.background.color
            self.background.color = .black
        }
        else {
            self.background.preferredColorScheme = .light
            self.background.color = self.background.lightColor
        }
    }
}
