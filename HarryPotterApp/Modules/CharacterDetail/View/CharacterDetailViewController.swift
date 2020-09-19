//
//  CharacterDetailViewController.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import UIKit

struct ItemConfig {
    var title: UILabel
    var description: UILabel
    var titleText: String
    var descriptionText: String
    var bottomAnchor: NSLayoutYAxisAnchor
}

class CharacterDetailViewController: UIViewController {
    private let characterDetailViewModel: CharacterDetailViewModelInterface

    private let nameLabel = UILabel()
    private var houseImage: UIImageView?
    private let houseText = UILabel()
    private let roleLabel = UILabel()
    private let roleDescriptionLabel = UILabel()
    private let schoolLabel = UILabel()
    private let schoolDescriptionLabel = UILabel()
    private let patronusLabel = UILabel()
    private let patronusDescriptionLabel = UILabel()
    private let ministryOfMagicLabel = UILabel()
    private let ministryOfMagicDescriptionLabel = UILabel()
    private let orderOfThePhoenixLabel = UILabel()
    private let orderOfThePhoenixDescriptionLabel = UILabel()
    private let dumbledoresArmyLabel = UILabel()
    private let dumbledoresArmyDescriptionLabel = UILabel()
    private let deathEatherLabel = UILabel()
    private let deathEatherDescriptionLabel = UILabel()
    private let speciesLabel = UILabel()
    private let speciesDescriptionLabel = UILabel()

    private let titleFontSize: CGFloat = 30
    private let headingFontSize: CGFloat = 22
    private let textFontSize: CGFloat = 15

    private let topSpace: CGFloat = 20
    private let leadingSpace: CGFloat = 20
    private let textSpace: CGFloat = 8
    private let itemsSpace: CGFloat = 12
    private let trailingSpace: CGFloat = -20
    private let titleToFirstTextSpace: CGFloat = 30

    init(characterDetailViewModel: CharacterDetailViewModelInterface) {
        self.characterDetailViewModel = characterDetailViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = UIColor(named: "Background")
        let character = characterDetailViewModel.character.value
        configureName(character: character)
        configureHouse(character: character)
        configureRole(character: character)
        configureSchool(character: character)
        configurePatronus(character: character)
        configureMinistryOfMagic(character: character)
        configureOrderOfThePhoenix(character: character)
        configureDumbledoresArmy(character: character)
        configureDeathEather(character: character)
        configureSpecies(character: character)
    }

    func configureName(character: Character) {
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = character.name
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.font = UIFont.systemFont(ofSize: titleFontSize)
        nameLabel.textColor = UIColor(named: "Text")
        let constraints = [
            nameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: topSpace)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func configureHouse(character: Character) {
        let house = character.house

        defer {
            configureHouseText(house: house)
        }

        guard let currentHouse = house else {
            return
        }

        houseImage = UIImageView(image: currentHouse.getImage())
        guard let houseImage = houseImage else { return }

        view.addSubview(houseImage)
        houseImage.translatesAutoresizingMaskIntoConstraints = false
        houseImage.contentMode = .scaleAspectFit
        let constraints = [
            houseImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: titleToFirstTextSpace),
            houseImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            houseImage.widthAnchor.constraint(equalToConstant: 150),
            houseImage.heightAnchor.constraint(equalToConstant: 150)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func configureHouseText(house: House?) {
        view.addSubview(houseText)
        houseText.text = house?.getText() ?? "Character does not have a house"
        houseText.textColor = UIColor(named: "Text")
        houseText.font = UIFont.systemFont(ofSize: headingFontSize)
        houseText.translatesAutoresizingMaskIntoConstraints = false
        let bottomAnchor = houseImage?.bottomAnchor ?? nameLabel.bottomAnchor
        let houseTextConstraints = [
            houseText.topAnchor.constraint(equalTo: bottomAnchor, constant: textSpace),
            houseText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingSpace)
        ]
        NSLayoutConstraint.activate(houseTextConstraints)
    }

    func configureRole(character: Character) {
        let roleDescription = character.role ?? "no role available"
        let itemConfig = ItemConfig(title: roleLabel, description: roleDescriptionLabel, titleText: "Role",
                                    descriptionText: roleDescription, bottomAnchor: houseText.bottomAnchor)
        configureItem(config: itemConfig)
    }

    func configureSchool(character: Character) {
        let schoolDescription = character.school ?? "no school available"
        let itemConfig = ItemConfig(title: schoolLabel, description: schoolDescriptionLabel, titleText: "School",
                                    descriptionText: schoolDescription, bottomAnchor: roleLabel.bottomAnchor)
        configureItem(config: itemConfig)
    }

    func configurePatronus(character: Character) {
        let patronusDescription = character.patronus ?? "no patronus available"
        let itemConfig = ItemConfig(title: patronusLabel, description: patronusDescriptionLabel, titleText: "Patronus",
                                    descriptionText: patronusDescription, bottomAnchor: schoolLabel.bottomAnchor)
        configureItem(config: itemConfig)
    }

    func configureMinistryOfMagic(character: Character) {
        let ministryOfMagicDescription = character.isMinistryOfMagic ? "YES" : "NO"
        let itemConfig = ItemConfig(title: ministryOfMagicLabel, description: ministryOfMagicDescriptionLabel,
                                    titleText: "Is Ministry of Magic",
                                    descriptionText: ministryOfMagicDescription,
                                    bottomAnchor: patronusLabel.bottomAnchor)
        configureItem(config: itemConfig)
    }

    func configureOrderOfThePhoenix(character: Character) {
        let orderOfThePhoenixDescription = character.isPartOfOrderOfThePhoenix ? "YES" : "NO"
        let titleText = "Is Part of the Order of the Phoenix"
        let itemConfig = ItemConfig(title: orderOfThePhoenixLabel, description: orderOfThePhoenixDescriptionLabel,
                                    titleText: titleText,
                                    descriptionText: orderOfThePhoenixDescription,
                                    bottomAnchor: ministryOfMagicLabel.bottomAnchor)
        configureItem(config: itemConfig)
    }

    func configureDumbledoresArmy(character: Character) {
        let dumbledoresArmyDescription = character.isPartOfDumbledoresArmy ? "YES" : "NO"
        let tileText = "Is Part of Dumbledore's Army"
        let itemConfig = ItemConfig(title: dumbledoresArmyLabel, description: dumbledoresArmyDescriptionLabel,
                                    titleText: tileText,
                                    descriptionText: dumbledoresArmyDescription,
                                    bottomAnchor: orderOfThePhoenixLabel.bottomAnchor)
        configureItem(config: itemConfig)
    }

    func configureDeathEather(character: Character) {
        let deathEatherDescription = character.isDeathEather ? "YES" : "NO"
        let tileText = "Is Death Eather"
        let itemConfig = ItemConfig(title: deathEatherLabel, description: deathEatherDescriptionLabel,
                                    titleText: tileText,
                                    descriptionText: deathEatherDescription,
                                    bottomAnchor: dumbledoresArmyLabel.bottomAnchor)
        configureItem(config: itemConfig)
    }

    func configureSpecies(character: Character) {
        let speciesDescription = character.species
        let tileText = "Species"
        let itemConfig = ItemConfig(title: speciesLabel, description: speciesDescriptionLabel,
                                    titleText: tileText,
                                    descriptionText: speciesDescription,
                                    bottomAnchor: deathEatherLabel.bottomAnchor)
        configureItem(config: itemConfig)
    }

    func configureItem(config: ItemConfig) {
        let itemTitle = config.title
        let itemDescription = config.description
        let itemTitleText = config.titleText
        let descriptionText = config.descriptionText
        let bottomAnchor = config.bottomAnchor

        view.addSubview(itemTitle)
        view.addSubview(itemDescription)
        itemTitle.translatesAutoresizingMaskIntoConstraints = false
        itemDescription.translatesAutoresizingMaskIntoConstraints = false

        itemTitle.text = itemTitleText
        itemDescription.text = descriptionText

        itemTitle.font = UIFont.boldSystemFont(ofSize: textFontSize)
        itemTitle.textColor = UIColor(named: "Text")
        itemTitle.numberOfLines = 0
        itemTitle.lineBreakMode = .byWordWrapping

        itemDescription.font = UIFont.systemFont(ofSize: textFontSize)
        itemDescription.textColor = UIColor(named: "Text")
        itemDescription.numberOfLines = 0
        itemDescription.lineBreakMode = .byWordWrapping

        let constraints = [
            itemTitle.topAnchor.constraint(equalTo: bottomAnchor, constant: itemsSpace),
            itemTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingSpace),
            itemTitle.bottomAnchor.constraint(equalTo: itemDescription.bottomAnchor),
            itemDescription.topAnchor.constraint(equalTo: itemTitle.topAnchor),
            itemDescription.leadingAnchor.constraint(equalTo: itemTitle.trailingAnchor, constant: textSpace),
            itemDescription.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor,
                                                      constant: trailingSpace)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
