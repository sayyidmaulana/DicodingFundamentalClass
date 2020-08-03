//
//  BerandaController.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

private let identifier = "Cell"
private let identifierCell = "identifierCell"
private let identifierAnotherCell = "identifierAnotherCell"

class BerandaController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        navigationItem.titleView = titleStackView
        setupView()
    }
    
    lazy var titleStackView: UIStackView = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.text = "Catalouge"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.tag = 0
        $0.addArrangedSubview(titleLabel)
        let subtitleLabel = UILabel()
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "List of the Game"
        subtitleLabel.font = UIFont.italicSystemFont(ofSize: 10)
        subtitleLabel.tintColor = ColorTheme.darkGray
        subtitleLabel.tag = 1
        $0.addArrangedSubview(subtitleLabel)
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        return stackView
    }(UIStackView())
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! BerandaCell
            cell.delegate = self
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierCell, for: indexPath) as! BerandaViewCell
            cell.delegate = self
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierAnotherCell, for: indexPath) as! BerandaAnotherCell
            cell.delegate = self
            return cell
        }

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: view.frame.width, height: 180)
        } else if indexPath.item == 1 {
            return CGSize(width: view.frame.width, height: 150)
        } else {
            return CGSize(width: view.frame.width, height: 180)
        }
    }
    
    private func setupView() {
        let share = UIBarButtonItem(image: UIImage(named: "ic_info"),  style: .plain, target: self, action: #selector(self.review))
        navigationItem.rightBarButtonItem = share
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BerandaCell.self, forCellWithReuseIdentifier: identifier)
        collectionView.register(BerandaViewCell.self, forCellWithReuseIdentifier: identifierCell)
        collectionView.register(BerandaAnotherCell.self, forCellWithReuseIdentifier: identifierAnotherCell)
        collectionView.backgroundColor = .gray
        collectionView.isScrollEnabled = false
    }
    
    @objc func review() {
        Utilities.showAlert(controller: self, message: "Copyright 2020", seconds: 1)
    }

}

