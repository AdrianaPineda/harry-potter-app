//
//  CharacterDetailCell.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import UIKit
struct DetailInfo {
    var title: String
    var description: String
}

class CharacterDetailCell: UITableViewCell {
    static let identifier = "DetailInfo"
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()

    private let textFontSize: CGFloat = 15
    private let topSpace: CGFloat = 8
    private let bottomSpace: CGFloat = -8
    private let verticalSpace: CGFloat = 5
    private let leadingSpace: CGFloat = 0
    private let trailingSpace: CGFloat = 0
    private let cellHeight: CGFloat = 60
    private let titleHeight: CGFloat = 20

    var info: DetailInfo? {
        didSet {
            configureUI()
        }
    }

    func configureUI() {
        guard let info = info else { return }
        let itemTitleText = info.title
        let descriptionText = info.description

        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)

        contentView.backgroundColor = UIColor(named: "Background")
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        configureLabel(label: titleLabel, text: itemTitleText, bold: true)
        configureLabel(label: descriptionLabel, text: descriptionText)

        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: topSpace),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: leadingSpace),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: trailingSpace),
            titleLabel.heightAnchor.constraint(equalToConstant: titleHeight),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: verticalSpace),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                     constant: bottomSpace),
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: cellHeight)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func configureLabel(label: UILabel, text: String, bold: Bool = false) {
        label.text = text
        label.font = bold ? UIFont.boldSystemFont(ofSize: textFontSize) : UIFont.systemFont(ofSize: textFontSize)
        label.textColor = UIColor(named: "Text")
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
    }
}
