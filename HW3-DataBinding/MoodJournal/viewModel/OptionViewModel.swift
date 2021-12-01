//
//  OptionViewModel.swift
//  MoodJournal
//
//  Created by FanRende on 2021/12/1.
//

import Combine
import UIKit
import AVKit

class OptionViewModel: ObservableObject {
    @Published var background = Background()
    @Published var showOptions: Bool = false
    @Published var showAlert: Bool = false
    @Published var showSettings: Bool = false
    
    func playBGM() {
        background.player.play()
    }
    
    func pauseBGM() {
        background.player.pause()
    }
    
    func changeBGM() {
        let item = AVPlayerItem(url: Bundle.main.url(forResource: Background.BGMList[background.music], withExtension: "mp3")!)
        
        background.player.pause()
        background.player.replaceCurrentItem(with: item)
        background.player.seek(to: .zero)
        background.player.play()
    }
    
    func adjustVolume() {
        background.player.volume = background.volume
    }
}
