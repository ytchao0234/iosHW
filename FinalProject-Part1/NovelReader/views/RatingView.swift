//
//  RatingView.swift
//  NovelReader
//
//  Created by FanRende on 2022/1/11.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Rating

    var body: some View {
        HStack {
            ForEach(1 ..< Int(Rating.maximum) + 1) { index in
                RatingView.star(for: Double(index), rating: Double(rating.amount))
                    .onTapGesture {
                        rating.amount = Double(index)
                    }
            }
        }
    }
    
    static func star(for index: Double, rating: Double) -> some View {
        let on = Image(systemName: "star.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.yellow)
        let off = Image(systemName: "star.fill")
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.gray)
        let half = Image(systemName: "star.leadinghalf.filled")
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
            return half
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(Rating(amount: 4, number: 2)))
    }
}
