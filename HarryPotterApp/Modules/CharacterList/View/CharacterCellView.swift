//
//  CharacterCellView.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import UIKit

class CharacterCellView: UICollectionViewCell {
    static let identifier = "CharacterCell"
    private let leadingSpace: CGFloat = 12
    private let trailingSpace: CGFloat = -12
    private let arrowSize: CGFloat = 12

    let nameLabel = UILabel(frame: .zero)
    private let disclosureImage = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        configureNameLabel()
        configureDisclosureIndicator()
    }

    func configureNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.textColor = UIColor.black
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leadingSpace),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func configureDisclosureIndicator() {
        contentView.addSubview(disclosureImage)
        disclosureImage.image = UIImage(named: "Arrow")
        disclosureImage.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            disclosureImage.widthAnchor.constraint(equalToConstant: arrowSize),
            disclosureImage.heightAnchor.constraint(equalToConstant: arrowSize),
            disclosureImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            disclosureImage.leadingAnchor.constraint(greaterThanOrEqualTo: nameLabel.trailingAnchor,
                                                     constant: leadingSpace),
            disclosureImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: trailingSpace)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
