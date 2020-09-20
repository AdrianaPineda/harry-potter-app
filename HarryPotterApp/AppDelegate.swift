//
//  AppDelegate.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let apiClient = HarryPotterApiClient(baseUrl: "https://www.potterapi.com/v1",
                                             apiKey: "REPLACE_ME")
        let viewModel = CharacterListViewModel(apiClient: apiClient)
        let characterListViewController = CharacterListViewController(characterListViewModel: viewModel)
        let navigationController = NavigationBuilder.build(viewController: characterListViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}
