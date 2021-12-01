//
//  SettingView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/30.
//

import SwiftUI

struct SettingView: View {
    @StateObject var optionViewModel: OptionViewModel
    
    var body: some View {
        
        return GeometryReader { geometry in
            VStack(alignment: .leading) {
                Button("< Back") {
                    optionViewModel.showSettings = false
                }
                
                Form {
                    Section(header: Text("背景")) {
                        ColorPicker("選擇背景顏色", selection: $optionViewModel.background.color)
                    }
                    
                    Section(header: Text("音樂")) {
                        Toggle(optionViewModel.background.isPlaying ? "播放音樂" : "暫停音樂", isOn: $optionViewModel.background.isPlaying)
                    
                    if optionViewModel.background.isPlaying {
                        HStack {
                            Text("音量")
                            Slider(value: $optionViewModel.background.volume, in: 0...5, step: 0.1, minimumValueLabel: Text("0%"), maximumValueLabel: Text("100%")) {}
                        }
                    }
                    
                        Picker(selection: $optionViewModel.background.music,
                               label: HStack{
                                          Spacer()
                                          Text("曲目")
                                          Spacer()
                                      }
                        ) {
                            ForEach(0 ..< 10) { item in
                                Text("BGM\(item)").tag(item)
                            }
                        }
                        .pickerStyle(.inline)
                    }
                }
                .background(optionViewModel.background.color)
                .cornerRadius(30)
            }
            .padding()
            .frame(width: geometry.size.width, alignment: .leading)
        }
        .background(optionViewModel.background.color)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(optionViewModel: OptionViewModel())
    }
}
