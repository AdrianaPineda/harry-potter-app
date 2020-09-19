//
//  CharacterDetailViewController.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    private let characterDetailViewModel: CharacterDetailViewModelInterface

    private let nameLabel = UILabel()
    private let houseImage = UIImageView()
    private let houseText = UILabel()
    private let roleLabel = UILabel()

    private let titleFontSize: CGFloat = 30
    private let textFontSize: CGFloat = 15

    private let topSpace: CGFloat = 20
    private let leadingSpace: CGFloat = 20
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
        configureName()
        configureHouse()
        configureRole()
    }

    func configureName() {
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = characterDetailViewModel.character.value.name
        nameLabel.font = UIFont.systemFont(ofSize: titleFontSize)
        nameLabel.textColor = UIColor(named: "Text")
        let constraints = [
            nameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: topSpace)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func configureHouse() {
        configureHouseText()

        guard let house = characterDetailViewModel.character.value.house else {
            houseText.text = "Character does not have a house"
            return
        }

        houseImage.image = house.getImage()
        houseText.text = house.getText()
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

    func configureHouseText() {
        view.addSubview(houseText)
        houseText.translatesAutoresizingMaskIntoConstraints = false
        let houseTextConstraints = [
            houseText.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: titleToFirstTextSpace),
            houseText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingSpace)
        ]
        NSLayoutConstraint.activate(houseTextConstraints)
    }

    func configureRole() {
        view.addSubview(roleLabel)
        roleLabel.translatesAutoresizingMaskIntoConstraints = false
        if let role = characterDetailViewModel.character.value.role {
            roleLabel.text = "Role: \(role)"
        }
        roleLabel.font = UIFont.systemFont(ofSize: textFontSize)
        roleLabel.textColor = UIColor(named: "Text")
        let constraints = [
            roleLabel.topAnchor.constraint(equalTo: houseText.bottomAnchor, constant: titleToFirstTextSpace),
            roleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingSpace)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
