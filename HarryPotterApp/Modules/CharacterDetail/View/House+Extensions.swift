//
//  House+Extensions.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import UIKit

extension House {
    func getImage() -> UIImage? {
        switch self {
        case .gryffindor:
            return UIImage(named: "gryffindor")
        case .slytherin:
            return UIImage(named: "slytherin")
        case .hufflepuff:
            return UIImage(named: "hufflepuff")
        case .ravenclaw:
            return UIImage(named: "ravenclaw")
        }
    }

    func getText() -> String {
        switch self {
        case .gryffindor:
            return "Gryffindor"
        case .slytherin:
            return "Slytherin"
        case .hufflepuff:
            return "Hufflepuff"
        case .ravenclaw:
            return "Ravenclaw"
        }
    }
}
