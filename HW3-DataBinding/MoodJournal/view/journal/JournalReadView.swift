//
//  JournalReadView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/24.
//

import SwiftUI

struct JournalReadView: View {
    let journal: Journal
    @StateObject var optionViewModel: OptionViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image(Background.themeList[optionViewModel.background.theme])
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                ScrollView(.vertical) {
                    VStack(alignment: .leading) {
                        Text(journal.title)
                            .font(.custom(Journal.fontFamilyList[journal.fontFamily], size: journal.fontSize + 6))
                            .fontWeight(.heavy)
                            .padding(.bottom)
                        Text(journal.content)
                            .font(.custom(Journal.fontFamilyList[journal.fontFamily], size: journal.fontSize))
                    }
                }
                .padding()
                .frame(width: geometry.size.width * 0.9, alignment: .leading)
                .background(optionViewModel.background.color.brightness(-0.12))
                .cornerRadius(30)
            }
            .frame(width: geometry.size.width)
        }
        .background(optionViewModel.background.color)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct JournalReadView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JournalReadView(journal: Journal.test1, optionViewModel: OptionViewModel())
        }
    }
}
