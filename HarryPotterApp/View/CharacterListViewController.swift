//
//  CharacterListViewController.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {
    private var sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)

    var collectionView: UICollectionView?
    var characterListViewModel: CharacterListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()

        characterListViewModel?.characters.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.collectionView?.reloadData()
            }
        }
    }

    func configureCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = sectionInset
//        layout.itemSize = CGSize(width: 60, height: 60)
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.backgroundColor = UIColor(named: "Background")
        collectionView.register(CharacterCellView.self, forCellWithReuseIdentifier: CharacterCellView.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
}

extension CharacterListViewController: UICollectionViewDataSource {
    func numberOfSections(in _: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return characterListViewModel?.characters.value.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCellView.identifier, for: indexPath)
        guard let characterCell = cell as? CharacterCellView else { return cell }

        let row = indexPath.row
        let charactersCount = characterListViewModel?.characters.value.count ?? 0
        if (row + 1) > charactersCount {
            return characterCell
        }

        if let currentChar = characterListViewModel?.characters.value[row] {
            characterCell.nameLabel.text = currentChar.name
        }

        return characterCell
    }
}

extension CharacterListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView,
                        layout _: UICollectionViewLayout,
                        sizeForItemAt _: IndexPath) -> CGSize {
        let padding = Int(sectionInset.left + sectionInset.right)
        let cellsWidth = Int(view.safeAreaLayoutGuide.layoutFrame.width) - padding
        return CGSize(width: cellsWidth, height: 50)
    }
}
