//
//  Character.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

enum House {
    case gryffindor
    case slytherin
    case ravenclaw
    case hufflepuff
}

enum BloodType {
    case halfBlood
    case pureBlood
    case muggle
    case unknown
}

struct Character {
    var name: String
    var role: String?
    var house: House?
    var school: String?
    var patronus: String?
    var isMinistryOfMagic: Bool
    var isPartOfOrderOfThePhoenix: Bool
    var isPartOfDumbledoresArmy: Bool
    var isDeathEather: Bool
    var species: String
    var bloodType: BloodType
}
