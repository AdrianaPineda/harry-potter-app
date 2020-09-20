//
//  CharacterDetailViewController.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    // Data
    private let characterDetailViewModel: CharacterDetailViewModelInterface
    private var details: [DetailInfo] {
        return characterDetailViewModel.character.value.getDetails()
    }

    // UI elements
    private let nameLabel = UILabel()
    private var houseImage = UIImageView()
    private let houseText = UILabel()
    private let detailsTableView = UITableView()

    // Font sizes
    private let titleFontSize: CGFloat = 30
    private let headingFontSize: CGFloat = 22
    private let textFontSize: CGFloat = 15

    // Image size
    private let imageWidthAspectRatio: CGFloat = 0.3
    private let imageHeightAspectRatio: CGFloat = 0.2

    // Constraints constants
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

        configureViewModel()
        configureUI()
    }

    private func configureViewModel() {
        characterDetailViewModel.character.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.configureUI()
            }
        }
    }

    private func configureUI() {
        view.backgroundColor = UIColor(named: "Background")
        navigationItem.largeTitleDisplayMode = .never

        let character = characterDetailViewModel.character.value
        configureName(name: character.name)
        configureHouse(house: character.house)
        configureDetails()
    }

    private func configureName(name: String) {
        view.addSubview(nameLabel)
        configureNameLabel(text: name)
        configureNameConstraints()
    }

    private func configureNameLabel(text: String) {
        nameLabel.text = text
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.font = UIFont.systemFont(ofSize: titleFontSize)
        nameLabel.textColor = UIColor(named: "Text")
    }

    private func configureNameConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            nameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: topSpace)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func configureHouse(house: House?) {
        view.addSubview(houseImage)
        view.addSubview(houseText)

        configureHouseImage(house: house)
        configureHouseText(house: house)

        configureHouseImageConstraints()
        configureHouseTextConstraints()
    }

    private func configureHouseImage(house: House?) {
        let image = house?.getImage() ?? UIImage(named: "no-house")
        houseImage.image = image
        houseImage.contentMode = .scaleAspectFit
    }

    private func configureHouseText(house: House?) {
        houseText.text = house?.getText() ?? "Character does not belong to any house"
        houseText.textColor = UIColor(named: "Text")
        houseText.font = UIFont.systemFont(ofSize: headingFontSize)
        houseText.numberOfLines = 0
        houseText.lineBreakMode = .byWordWrapping
        houseText.textAlignment = .center
    }

    private func configureHouseImageConstraints() {
        houseImage.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            houseImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: titleToFirstItemSpace),
            houseImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            houseImage.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor,
                                              multiplier: imageWidthAspectRatio),
            houseImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor,
                                               multiplier: imageHeightAspectRatio)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func configureHouseTextConstraints() {
        houseText.translatesAutoresizingMaskIntoConstraints = false

        let houseTextConstraints = [
            houseText.topAnchor.constraint(equalTo: houseImage.bottomAnchor, constant: imageToFirstTextSpace),
            houseText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingSpace),
            houseText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                constant: trailingSpace)
        ]
        NSLayoutConstraint.activate(houseTextConstraints)
    }

    private func configureDetails() {
        view.addSubview(detailsTableView)

        configureDetailsTableView()
        configureDetailsTableViewConstraints()
    }

    private func configureDetailsTableView() {
        detailsTableView.tableFooterView = UIView(frame: .zero)
        detailsTableView.backgroundColor = UIColor(named: "Background")
        detailsTableView.rowHeight = UITableView.automaticDimension
        detailsTableView.register(CharacterDetailCell.self, forCellReuseIdentifier: CharacterDetailCell.identifier)
        detailsTableView.dataSource = self
        detailsTableView.delegate = self
        detailsTableView.separatorInset = .zero
    }

    private func configureDetailsTableViewConstraints() {
        detailsTableView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            detailsTableView.topAnchor.constraint(equalTo: houseText.bottomAnchor, constant: itemsSpace),
            detailsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                      constant: leadingSpace),
            detailsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                                       constant: trailingSpace),
            detailsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                                     constant: bottomSpace)
        ]
        NSLayoutConstraint.activate(constraints)
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
