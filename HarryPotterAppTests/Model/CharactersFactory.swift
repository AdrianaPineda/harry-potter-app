//
//  CharactersFactory.swift
//  HarryPotterAppTests
//
//  Created by Adriana Pineda on 20/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import Foundation
@testable import HarryPotterApp

class CharactersFactory {
    static func getCharacters(number: Int) -> [Character] {
        var characters: [Character] = []
        for i in 1 ... number {
            let character = CharacterFactory.getCharacter(id: i)
            characters.append(character)
        }

        return characters
    }
}
