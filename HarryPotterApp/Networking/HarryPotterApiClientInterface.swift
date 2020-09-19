//
//  HarryPotterApiClientInterface.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//
import PromiseKit

protocol HarryPotterApiClientInterface {
    init(baseUrl: String, apiKey: String)
    func getCharacters() -> Promise<[Character]>
}
