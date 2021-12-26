//
//  RatingView.swift
//  NovelReader
//
//  Created by FanRende on 2021/12/26.
//

import SwiftUI

struct RatingView: View {
    static let maximumRating = Int(5)
    @State var rating = Int(3)

    var body: some View {
        HStack {
            ForEach(1 ..< RatingView.maximumRating + 1) { index in
                RatingView.star(for: index, rating: rating)
                    .onTapGesture {
                        rating = index
                    }
            }
        }
    }
    
    static func star(for index: Int, rating: Int) -> some View {
        let on = Image(systemName: "star.fill")
            .foregroundColor(Color.yellow)
        let off = Image(systemName: "star.fill")
            .foregroundColor(Color.gray)
        
        if index <= rating {
            return on
        }
        else {
            return off
        }
    }
    
    static func starD(for index: Double, rating: Double) -> some View {
        let on = Image(systemName: "star.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.yellow)
        let off = Image(systemName: "star.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.gray)
        let halfOn = Image(systemName: "star.leadinghalf.filled")
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.yellow)
        
        if index <= rating {
            return on
        }
        else if index > ceil(rating) {
            return off
        }
        else {
            return halfOn
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
    }
}
