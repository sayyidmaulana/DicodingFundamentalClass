//
//  FavoriteGamesController.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/09/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

class FavoriteGamesController: UIViewController {
    
    let identifier = "cell"
    
    lazy var titleStackView: UIStackView = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.text = "Catalouge"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.tag = 0
        $0.addArrangedSubview(titleLabel)
        let subtitleLabel = UILabel()
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "List of your favorites Games"
        subtitleLabel.font = UIFont.italicSystemFont(ofSize: 10)
        subtitleLabel.tintColor = ColorTheme.darkGray
        subtitleLabel.tag = 1
        $0.addArrangedSubview(subtitleLabel)
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        return stackView
    }(UIStackView())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        cellShadow()
    }
    
    fileprivate lazy var collectionSubview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = true
        cv.backgroundColor = .white
        
        return cv
    }()
    
    private func setupView() {
        navigationItem.titleView = titleStackView
        collectionSubview.delegate = self
        collectionSubview.dataSource = self
        collectionSubview.register(FavoriteCell.self, forCellWithReuseIdentifier: identifier)
        view.addSubview(collectionSubview)
        collectionSubview.setAnchor(top: view.topAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    private func cellShadow() {
        self.view.backgroundColor = .white
        self.view.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.layer.shadowOpacity = 0.3
        self.view.layer.shadowOffset = CGSize.zero
        self.view.layer.shadowRadius = 3.0
        self.view.layer.cornerRadius = 10
    }

}

extension FavoriteGamesController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionSubview.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FavoriteCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 8 * 4, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
}
