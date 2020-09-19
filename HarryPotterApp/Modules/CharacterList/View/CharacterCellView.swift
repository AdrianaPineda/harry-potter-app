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

    var nameLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        configureNameLabel()
    }

    func configureNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.textColor = UIColor.black
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: 8),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                              constant: 8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
