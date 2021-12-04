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
    
    var timer = Timer()
    
    func playBGM() {
        background.player.play()
        
        timer.invalidate()
        timer = Timer.scheduledTimer(
            withTimeInterval: background.player.currentItem?.asset.duration.seconds ?? 0,
            repeats: false,
            block: { _ in
                self.background.player.removeAllItems()
                
                switch self.background.playMode {
                case 0:
                    break
                case 1:
                    print("change 1")
                    self.background.music = (self.background.music + 1) % Background.BGMList.count
                    break
                case 2:
                    print("change 2")
                    self.background.music = Int.random(in: 0..<Background.BGMList.count)
                    break

                default:
                    break
                }
                
                let nextItem = AVPlayerItem(url: Bundle.main.url(forResource: Background.BGMList[self.background.music], withExtension: "mp3")!)
                self.background.player.insert(nextItem, after: nil)
                self.playBGM()
            }
        )
    }
    
    func pauseBGM() {
        background.player.pause()
    }
    
    func changeBGM() {
        let item = AVPlayerItem(url: Bundle.main.url(forResource: Background.BGMList[background.music], withExtension: "mp3")!)
        
        pauseBGM()
        background.player.replaceCurrentItem(with: item)
        background.player.seek(to: .zero)
        playBGM()
    }
    
    func adjustVolume() {
        background.player.volume = background.volume
    }
}
