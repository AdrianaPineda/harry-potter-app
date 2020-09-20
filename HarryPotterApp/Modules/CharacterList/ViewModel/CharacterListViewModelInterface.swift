//
//  CharacterListViewModelInterface.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

protocol CharacterListViewModelInterface {
    var characters: Dynamic<[Character]> { get }
    func loadCharacters()
    func getCharacterDetailViewModel(index: Int) -> CharacterDetailViewModelInterface?
}
