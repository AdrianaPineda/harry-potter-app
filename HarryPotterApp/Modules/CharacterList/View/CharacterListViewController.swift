//
//  CharacterListViewController.swift
//  HarryPotterApp
//
//  Created by Adriana Pineda on 19/09/2020.
//  Copyright © 2020 Adriana Pineda. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController {
    private let sectionInsets = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
    private let cellHeight = 40

    var collectionView: UICollectionView?
    var characterListViewModel: CharacterListViewModelInterface?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        configureNavigationBar()
        configureCollectionView()
        configureViewModel()
    }

    func configureNavigationBar() {
        title = "Harry Potter Characters"
    }

    func configureCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = sectionInsets
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

    func configureViewModel() {
        characterListViewModel?.characters.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.collectionView?.reloadData()
            }
        }
        characterListViewModel?.loadCharacters()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.frame
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
        let padding = Int(sectionInsets.left + sectionInsets.right)
        let cellsWidth = Int(view.safeAreaLayoutGuide.layoutFrame.width) - padding
        return CGSize(width: cellsWidth, height: cellHeight)
    }
}

extension CharacterListViewController: UICollectionViewDelegate {
    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let characterListViewModel = characterListViewModel else {
            print("Invalid character list view model")
            return
        }

        let rowSelected = indexPath.row
        guard let characterDetailViewModel = characterListViewModel.getCharacterDetailViewModel(index: rowSelected)
        else {
            return
        }
        let characterDetailViewController =
            CharacterDetailViewController(characterDetailViewModel: characterDetailViewModel)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back to list", style: .plain, target: nil,
                                                           action: nil)
        navigationController?.pushViewController(characterDetailViewController, animated: true)
    }
}
