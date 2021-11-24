//
//  JournalBlockView.swift
//  MoodJournal
//
//  Created by FanRende on 2021/11/23.
//

import SwiftUI

struct JournalBlockView: View {
    let journal: Journal
    
    var body: some View {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss E, dd MMM yyyy"
        
        return ZStack(alignment: .topLeading) {
            Rectangle()
                .foregroundColor(.secondary)
                .opacity(0.5)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text(journal.title)
                    .font(.title2)
                    .foregroundColor(.black)
                    .lineLimit(2)
                
                Spacer()
                
                Label(dateFormatter.string(from: journal.time), systemImage: "clock")
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .padding(10)
        }
        .frame(height: 120)
    }
}

struct JournalBlockView_Previews: PreviewProvider {
    static var previews: some View {
        JournalBlockView(journal: Journal(title: "hhhhhhhhhhh", content: "aaa", time: Date()))
    }
}
