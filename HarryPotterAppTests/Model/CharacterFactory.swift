//
//  CharacterFactory.swift
//  HarryPotterAppTests
//
//  Created by Adriana Pineda on 20/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

@testable import HarryPotterApp

import Foundation

class CharacterFactory {
    static func getCharacter(id: Int) -> Character {
        return Character(name: "character name \(id)", role: "role", house: .gryffindor, school: "hogwarts",
                         patronus: "otter", isMinistryOfMagic: true, isPartOfOrderOfThePhoenix: false,
                         isPartOfDumbledoresArmy: false, isDeathEather: true, species: "human", bloodType: .pureBlood)
    }
}
