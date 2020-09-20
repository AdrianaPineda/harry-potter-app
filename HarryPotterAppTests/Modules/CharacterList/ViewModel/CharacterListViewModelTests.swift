//
//  CharacterListViewModelTests.swift
//  HarryPotterAppTests
//
//  Created by Adriana Pineda on 20/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

@testable import HarryPotterApp

import Cuckoo
import PromiseKit
import XCTest

enum CharacterListViewModelTestsError: Error {
    case getCharactersFailed
}

class CharacterListViewModelTests: XCTestCase {
    var characterListViewModel: CharacterListViewModel?
    let (getCharactersPromise, getCharactersSeal) = Promise<[Character]>.pending()
    let apiClient = MockHarryPotterApiClientInterface(baseUrl: "random", apiKey: "random")

    override func setUp() {
        characterListViewModel = CharacterListViewModel(apiClient: apiClient)
    }

    private func setupApiClientStub() {}

    // MARK: - loadCharacters

    func testLoadCharacters_Successful() {
        // Arrange
        stub(apiClient) { stub in
            when(stub.getCharacters()).thenReturn(getCharactersPromise)
        }

        // Act
        characterListViewModel?.loadCharacters()

        let characters = CharactersFactory.getCharacters(number: 5)
        getCharactersSeal.fulfill(characters)

        let loadCharactersExpectation = expectation(description: "Load characters")
        getCharactersPromise.ensure {
            loadCharactersExpectation.fulfill()
        }.cauterize()

        // Assert
        waitForExpectations(timeout: 5, handler: nil)
        verify(apiClient).getCharacters()
        XCTAssertEqual(characterListViewModel?.characters.value, characters)
    }

    func testLoadCharacters_Failed() {
        // Arrange
        stub(apiClient) { stub in
            when(stub.getCharacters()).thenReturn(getCharactersPromise)
        }

        // Act
        characterListViewModel?.loadCharacters()

        getCharactersSeal.reject(CharacterListViewModelTestsError.getCharactersFailed)

        let loadCharactersExpectation = expectation(description: "Load characters")
        getCharactersPromise.ensure {
            loadCharactersExpectation.fulfill()
        }.cauterize()

        // Assert
        waitForExpectations(timeout: 5, handler: nil)
        verify(apiClient).getCharacters()
        XCTAssertEqual(characterListViewModel?.characters.value.count, 0)
    }

    func testBindCharacters() {
        // Arrange
        stub(apiClient) { stub in
            when(stub.getCharacters()).thenReturn(getCharactersPromise)
        }

        let characters = CharactersFactory.getCharacters(number: 3)

        let charactersBindExpectation = expectation(description: "Bind characters")
        characterListViewModel?.characters.bind { charactersResponse in
            XCTAssertEqual(characters, charactersResponse)
            charactersBindExpectation.fulfill()
        }

        // Act
        characterListViewModel?.loadCharacters()

        getCharactersSeal.fulfill(characters)

        // Assert
        waitForExpectations(timeout: 5, handler: nil)
        verify(apiClient).getCharacters()
        XCTAssertEqual(characterListViewModel?.characters.value, characters)
    }

    // MARK: - getCharacterDetailViewModel

    func testGetCharacterDetailViewModel_ValidIndex() {
        // Arrange
        let characters = CharactersFactory.getCharacters(number: 3)
        characterListViewModel?.characters = Dynamic(characters)

        // Act
        let index = 2
        let detailViewModel = characterListViewModel?.getCharacterDetailViewModel(index: index)

        // Assert
        XCTAssertEqual(detailViewModel?.character.value, characters[index])
    }

    func testGetCharacterDetailViewModel_InvalidIndex() {
        // Arrange
        let characters = CharactersFactory.getCharacters(number: 3)
        characterListViewModel?.characters = Dynamic(characters)

        // Act
        let index = 3
        let detailViewModel = characterListViewModel?.getCharacterDetailViewModel(index: index)

        // Assert
        XCTAssertNil(detailViewModel)
    }
}
