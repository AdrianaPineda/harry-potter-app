//
//  CharactersViewModel.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import Foundation

class CharacterListViewModel: CharacterListViewModelInterface {
    private let apiClient: HarryPotterApiClientInterface
    var characters: Dynamic<[Character]> = Dynamic([])

    init(apiClient: HarryPotterApiClientInterface) {
        self.apiClient = apiClient
    }

    func loadCharacters() {
        apiClient.getCharacters().done { [weak self] (characters: [Character]) in
            self?.characters.value = characters
        }.catch { error in
            print("Error fetching characters \(error.localizedDescription)")
        }
    }

    func getCharacterDetailViewModel(index: Int) -> CharacterDetailViewModelInterface? {
        if (index + 1) > characters.value.count {
            return nil
        }
        let character = characters.value[index]
        let characterDetailViewModel = CharacterDetailViewModel(character: character)
        return characterDetailViewModel
    }
}
