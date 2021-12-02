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
                        Picker(
                            selection: $optionViewModel.background.theme,
                            label: Text("選擇背景主題")
                                .modifier(FormFactorModifier(color: optionViewModel.background.color))
                        ) {
                            ForEach(Background.themeList.indices) { index in
                                Image(Background.themeList[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width*0.65)
                                    .tag(index)
                            }
                        }
                        .pickerStyle(.inline)
                        ColorPicker(
                            selection: $optionViewModel.background.color
                        ) {
                            Text("選擇背景顏色")
                                .modifier(FormFactorModifier(color: optionViewModel.background.color))
                        }
                    }
                    
                    Section(header: Text("音樂")) {
                        Toggle(isOn: $optionViewModel.background.isPlaying) {
                            Text(optionViewModel.background.isPlaying ? "播放音樂" : "暫停音樂")
                                .modifier(FormFactorModifier(color: optionViewModel.background.color))
                            }
                            .onChange(of: optionViewModel.background.isPlaying) { newValue in
                                if newValue {
                                    optionViewModel.playBGM()
                                }
                                else {
                                    optionViewModel.pauseBGM()
                                }
                            }
                    
                    if optionViewModel.background.isPlaying {
                        HStack {
                            Text("音量")
                                .modifier(FormFactorModifier(color: optionViewModel.background.color))
                            Slider(value: $optionViewModel.background.volume, in: 0...5, step: 0.1, minimumValueLabel: Text("0%"), maximumValueLabel: Text("100%")) {}
                            .onChange(of: optionViewModel.background.volume) { newValue in
                                optionViewModel.adjustVolume()
                            }
                        }
                    }
                    
                        Picker(selection: $optionViewModel.background.music,
                               label: HStack{
                                          Spacer()
                                          Text("曲目")
                                            .modifier(FormFactorModifier(color: optionViewModel.background.color))
                                          Spacer()
                                      }
                        ) {
                            ForEach(Background.BGMList.indices) { index in
                                Text(Background.BGMList[index]).tag(index)
                            }
                        }
                        .pickerStyle(.inline)
                        .onChange(of: optionViewModel.background.music) { newValue in
                            optionViewModel.changeBGM()
                        }
                    }
                }
                .background(optionViewModel.background.color.brightness(-0.12))
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
