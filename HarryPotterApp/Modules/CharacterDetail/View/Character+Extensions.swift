//
//  Character+Extensions.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 20/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import Foundation

extension Character {
    func getDetails() -> [DetailInfo] {
        return [
            DetailInfo(title: "Role", description: role ?? "no role available"),
            DetailInfo(title: "School", description: school ?? "no school available"),
            DetailInfo(title: "Patronus", description: patronus ?? "no patronus available"),
            DetailInfo(title: "Is Ministry of Magic", description: isMinistryOfMagic ? "YES" : "NO"),
            DetailInfo(title: "Is Part of the Order of the Phoenix",
                       description: isPartOfOrderOfThePhoenix ? "YES" : "NO"),
            DetailInfo(title: "Is Part of Dumbledore's Army",
                       description: isPartOfDumbledoresArmy ? "YES" : "NO"),
            DetailInfo(title: "Is Death Eather", description: isDeathEather ? "YES" : "NO"),
            DetailInfo(title: "Species", description: species)
        ]
    }
}
