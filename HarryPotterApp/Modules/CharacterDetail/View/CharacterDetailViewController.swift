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
    private var details: [DetailInfo] {
        return characterDetailViewModel.character.value.getDetails()
    }

    let tableView = UITableView()

    private let nameLabel = UILabel()
    private var houseImage = UIImageView()
    private let houseText = UILabel()

    private let titleFontSize: CGFloat = 30
    private let headingFontSize: CGFloat = 22
    private let textFontSize: CGFloat = 15

    private let imageSize: CGFloat = 150

    private let topSpace: CGFloat = 20
    private let bottomSpace: CGFloat = -8
    private let leadingSpace: CGFloat = 20
    private let trailingSpace: CGFloat = -20
    private let textSpace: CGFloat = 8
    private let itemsSpace: CGFloat = 12
    private let titleToFirstItemSpace: CGFloat = 25
    private let imageToFirstTextSpace: CGFloat = 15

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
        configureName(name: character.name)
        configureHouse(house: character.house)
        configureDetails()
    }

    func configureName(name: String) {
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = name
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

    func configureHouse(house: House?) {
        let image = house?.getImage() ?? UIImage(named: "no-house")
        houseImage = UIImageView(image: image)
        view.addSubview(houseImage)
        houseImage.translatesAutoresizingMaskIntoConstraints = false
        houseImage.contentMode = .scaleAspectFit
        let constraints = [
            houseImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: titleToFirstItemSpace),
            houseImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            houseImage.widthAnchor.constraint(equalToConstant: imageSize),
            houseImage.heightAnchor.constraint(equalToConstant: imageSize)
        ]
        NSLayoutConstraint.activate(constraints)

        configureHouseText(house: house)
    }

    func configureHouseText(house: House?) {
        view.addSubview(houseText)
        houseText.text = house?.getText() ?? "Character does not belong to any house"
        houseText.textColor = UIColor(named: "Text")
        houseText.font = UIFont.systemFont(ofSize: headingFontSize)
        houseText.numberOfLines = 0
        houseText.lineBreakMode = .byWordWrapping
        houseText.textAlignment = .center
        houseText.translatesAutoresizingMaskIntoConstraints = false
        let houseTextConstraints = [
            houseText.topAnchor.constraint(equalTo: houseImage.bottomAnchor, constant: imageToFirstTextSpace),
            houseText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingSpace),
            houseText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: trailingSpace)
        ]
        NSLayoutConstraint.activate(houseTextConstraints)
    }

    func configureDetails() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = UIColor(named: "Background")
        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)

        let constraints = [
            tableView.topAnchor.constraint(equalTo: houseText.bottomAnchor, constant: itemsSpace),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                               constant: leadingSpace),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: trailingSpace),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: bottomSpace)
        ]
        NSLayoutConstraint.activate(constraints)

        tableView.register(CharacterDetailCell.self, forCellReuseIdentifier: CharacterDetailCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = .zero
    }
}

extension CharacterDetailViewController: UITableViewDataSource {
    func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return details.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterDetailCell.identifier, for: indexPath)
        guard let characterDetailCell = cell as? CharacterDetailCell else { return cell }
        characterDetailCell.info = details[indexPath.row]
        characterDetailCell.selectionStyle = .none
        return characterDetailCell
    }
}

extension CharacterDetailViewController: UITableViewDelegate {
    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_: UITableView, estimatedHeightForRowAt _: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
