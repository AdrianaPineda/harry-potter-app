//
//  CharacterDetailViewModelTests.swift
//  HarryPotterAppTests
//
//  Created by Adriana Pineda on 20/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

@testable import HarryPotterApp
import XCTest

class CharacterDetailViewModelTests: XCTestCase {
    var characterDetailViewModel: CharacterDetailViewModel?

    func testInit() {
        // Arrange - Act
        let character = CharacterFactory.getCharacter(id: 3)
        characterDetailViewModel = CharacterDetailViewModel(character: character)

        // Assert
        XCTAssertEqual(characterDetailViewModel?.character.value, character)
    }

    func testBindCharacter() {
        // Arrange
        let character = CharacterFactory.getCharacter(id: 3)
        characterDetailViewModel = CharacterDetailViewModel(character: character)

        let updatedCharacter = CharacterFactory.getCharacter(id: 5)
        let characterBindExpectation = expectation(description: "Bind character")
        characterDetailViewModel?.character.bind { characterResponse in
            XCTAssertEqual(updatedCharacter, characterResponse)
            characterBindExpectation.fulfill()
        }

        // Act
        characterDetailViewModel?.character.value = updatedCharacter

        // Assert
        waitForExpectations(timeout: 5, handler: nil)
    }
}
