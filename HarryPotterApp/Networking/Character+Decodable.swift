//
//  Character+Decodable.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

extension House {
    static func from(string: String?) -> House? {
        switch string {
        case "Gryffindor":
            return .gryffindor
        case "Slytherin":
            return .slytherin
        case "Ravenclaw":
            return .ravenclaw
        case "Hufflepuff":
            return .hufflepuff
        default:
            return nil
        }
    }
}

extension BloodType {
    static func from(string: String?) -> BloodType {
        switch string {
        case "half-blood":
            return .halfBlood
        case "pure-blood":
            return .pureBlood
        case "muggle":
            return .muggle
        default:
            return .unknown
        }
    }
}

extension Character: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case role
        case house
        case school
        case patronus
        case isMinistryOfMagic = "ministryOfMagic"
        case isPartOfOrderOfThePhoenix = "orderOfThePhoenix"
        case isPartOfDumbledoresArmy = "dumbledoresArmy"
        case isDeathEather = "deathEater"
        case bloodType = "bloodStatus"
        case species
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        role = try values.decodeIfPresent(String.self, forKey: .role)
        let houseAsString = try values.decodeIfPresent(String.self, forKey: .house)
        house = House.from(string: houseAsString)
        school = try values.decodeIfPresent(String.self, forKey: .school)
        patronus = try values.decodeIfPresent(String.self, forKey: .patronus)
        isMinistryOfMagic = try values.decodeIfPresent(Bool.self, forKey: .isMinistryOfMagic) ?? false
        isPartOfOrderOfThePhoenix = try values.decodeIfPresent(Bool.self, forKey: .isPartOfOrderOfThePhoenix) ?? false
        isPartOfDumbledoresArmy = try values.decodeIfPresent(Bool.self, forKey: .isPartOfDumbledoresArmy) ?? false
        isDeathEather = try values.decodeIfPresent(Bool.self, forKey: .isDeathEather) ?? false
        let bloodTypeAsString = try values.decode(String.self, forKey: .bloodType)
        bloodType = BloodType.from(string: bloodTypeAsString)
        species = try values.decode(String.self, forKey: .species)
    }
}
