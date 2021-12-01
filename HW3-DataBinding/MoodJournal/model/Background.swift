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
    var music: Int = 0
    var isPlaying: Bool = true
    var volume: Double = 1
}

extension Background {
    static let BGMList: [AVPlayerItem] = [
        
    ]
}
