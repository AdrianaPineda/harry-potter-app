//
//  Character+Equatable.swift
//  HarryPotterAppTests
//
//  Created by Adriana Pineda on 20/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//
@testable import HarryPotterApp

import Cuckoo
import Foundation

extension Character: Equatable {
    public static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.name == rhs.name && lhs.role == rhs.role && lhs.house == rhs.house && lhs.school == rhs.school && lhs.patronus == rhs.patronus && lhs.isMinistryOfMagic == rhs.isMinistryOfMagic && lhs.isPartOfOrderOfThePhoenix == rhs.isPartOfOrderOfThePhoenix && lhs.isPartOfDumbledoresArmy == rhs.isPartOfDumbledoresArmy && lhs.isDeathEather == rhs.isDeathEather && lhs.species == rhs.species && lhs.bloodType == rhs.bloodType
    }

    func equal(to value: Character) -> ParameterMatcher<Character> {
        return ParameterMatcher { comparedValue in
            value == comparedValue
        }
    }
}
