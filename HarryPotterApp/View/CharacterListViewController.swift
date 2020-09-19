//
//  CharacterListViewController.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.backgroundColor = UIColor.from(hexString: "F8F8F8")
        collectionView.register(CharacterCellView.self, forCellWithReuseIdentifier: "CharacterCell")
        view.addSubview(collectionView)
    }
}
