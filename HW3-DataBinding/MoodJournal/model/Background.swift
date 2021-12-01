//
//  Background.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/30.
//

import SwiftUI
import AVKit

struct Background {
    var color = Color.white
    var player = AVQueuePlayer()
    var looper: AVPlayerLooper
    var music: Int = 0
    var isPlaying: Bool = true
    var volume: Float = 1
    
    init() {
        self.looper = AVPlayerLooper(player: self.player, templateItem: AVPlayerItem(url: Bundle.main.url(forResource: Background.BGMList[self.music], withExtension: "mp3")!))
    }
}
extension Background {
    static let BGMList: [String] = [
        "Sunshine_from_Someday",
        "Surrounded_by_Smiles",
        "Theme_of_Love",
        "One_Morning",
        "Joyful_Moments",
        "The_Unforgettable_Light",
        "The_Thousand_Year_Wish",
        "The_Divine_Crystal",
        "City_of_the_Butterflys_Dream",
        "The_Despair",
        "Confidentially"
    ]
}
