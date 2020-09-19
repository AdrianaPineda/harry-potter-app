//
//  CharacterDetailViewModel.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import Foundation
class CharacterDetailViewModel: CharacterDetailViewModelInterface {
    var character: Dynamic<Character>

    init(character: Character) {
        self.character = Dynamic(character)
    }
}
