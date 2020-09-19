//
//  FavoriteGamesController.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/09/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit
import CoreData

class FavoriteGamesController: UIViewController {
    
    var itemArray = [Result]()
    private lazy var gamesProvider: FavoriteGamesProvider = { return FavoriteGamesProvider() }()
    
    let identifier = "cell"
    
    var spinner = UIActivityIndicatorView(style: .large)
    var there = false
    
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
    
    fileprivate lazy var imgMenu: UIImageView = {
        let imgViewMenu = UIImageView()
        imgViewMenu.contentMode = .scaleAspectFit
        imgViewMenu.image = #imageLiteral(resourceName: "dicoding")
        return imgViewMenu
    }()
    let textMenu: UILabel = {
        let textViewMenu = UILabel()
        textViewMenu.textAlignment = .center
        textViewMenu.font = UIFont.systemFont(ofSize: 12)
        textViewMenu.text = "Tidak ada data !"
        textViewMenu.numberOfLines = 50
        return textViewMenu
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        cellShadow()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionSubview.reloadData()
        getFavorite()
    }
    
    fileprivate lazy var collectionSubview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = true
        cv.backgroundColor = .white
        
        return cv
    }()
    
    func getFavorite() {
        self.spinner.startAnimating()
        self.spinner.isHidden = false
        gamesProvider.getAllData { (gameData) in
                self.spinner.isHidden = true
                if gameData.isEmpty {
                    DispatchQueue.main.async {
                        self.imgMenu.isHidden = false
                        self.textMenu.isHidden = false
                        self.collectionSubview.isHidden = true
                        self.collectionSubview.reloadData()
                    }
                } else {
                    DispatchQueue.main.async {
                        self.imgMenu.isHidden = true
                        self.textMenu.isHidden = true
                        self.collectionSubview.isHidden = false
                        self.itemArray = gameData
                        self.collectionSubview.reloadData()
                    }
                }
        }
    }
    
    private func setupView() {
        navigationItem.titleView = titleStackView
        collectionSubview.delegate = self
        collectionSubview.dataSource = self
        collectionSubview.register(FavoriteCell.self, forCellWithReuseIdentifier: identifier)
        view.addSubview(collectionSubview)
        collectionSubview.setAnchor(top: view.topAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        view.addSubview(imgMenu)
        view.addSubview(textMenu)
        imgMenu.setAnchor(top: view.topAnchor, left: view.leadingAnchor, bottom: nil, right: nil, paddingTop: 150, paddingLeft: 120, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        textMenu.setAnchor(top: imgMenu.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 120, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
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
        return itemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = self.itemArray[indexPath.row]
        let cell = collectionSubview.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FavoriteCell
        cell.setData(data: data)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailBerandaViewController()
        vc.gamesId = "\(itemArray[indexPath.row].id ?? 0)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
