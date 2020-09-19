//
//  CharactersViewModel.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import Foundation

class CharacterListViewModel {
    let apiClient: HarryPotterApiClientInterface
    var characters: Dynamic<[Character]> = Dynamic([])

    init(apiClient: HarryPotterApiClientInterface) {
        self.apiClient = apiClient
        loadCharacters()
    }

    func loadCharacters() {
        apiClient.getCharacters().done { [weak self] (characters: [Character]) in
            self?.characters.value = characters
        }.catch { error in
            print("Error fetching characters \(error.localizedDescription)")
        }
    }
}
