//
//  CharacterDetailView.swift
//  AnotherEden
//
//  Created by User10 on 2021/11/4.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    
    var body: some View {
        List {
            Image(character.name)
                .resizable()
                .scaledToFit()
            
            Text(character.intro)
        }
        .toolbar(content: {
            ToolbarItem(placement: .principal) {
                Text(character.name)
            }
        })
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CharacterDetailView(character: Character.main.first!)
        }
    }
}
