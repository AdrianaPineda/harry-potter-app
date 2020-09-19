//
//  NavigationViewController.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import UIKit

class NavigationBuilder {
    static func build(viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)

        let titleColor = UIColor(named: "Title") ?? .black
        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: titleColor,
            .font: UIFont.systemFont(ofSize: 24)
        ]

        let largeTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: titleColor,
            .font: UIFont.systemFont(ofSize: 34)
        ]

        navigationController.navigationBar.titleTextAttributes = textAttributes
        navigationController.navigationBar.largeTitleTextAttributes = largeTextAttributes
        navigationController.navigationBar.barTintColor = UIColor(named: "Background")
        navigationController.navigationBar.tintColor = titleColor
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.prefersLargeTitles = true

        return navigationController
    }
}
