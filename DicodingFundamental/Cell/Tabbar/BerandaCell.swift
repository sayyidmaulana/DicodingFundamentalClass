//
//  BerandaCell.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

protocol BerandaProtocol: class {
    func didBerandaPushed(id: Int)
}

private let identifier = "Cell"

class BerandaCell: UICollectionViewCell {
    
    var games : [GenreResult] = []
    
        var spinner = UIActivityIndicatorView(style: .large)
    
    weak var delegate: BerandaProtocol?

        override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
            setupView()
            cellShadow()
            checkGenre()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate lazy var collectionSubview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = true
        cv.backgroundColor = .white
        
        return cv
    }()
    
    private func setupView() {
        collectionSubview.delegate = self
        collectionSubview.dataSource = self
        collectionSubview.register(CatalougeOneCell.self, forCellWithReuseIdentifier: identifier)
        
        addSubview(collectionSubview)
        collectionSubview.setAnchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        spinner.startAnimating()
        addSubview(spinner)
        spinner.setAnchor(top: topAnchor, left: leadingAnchor, bottom: nil, right: trailingAnchor, paddingTop: 80, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 0, height: 0)
    }
    
    private func cellShadow() {
        self.backgroundColor = .white
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 3.0
        self.layer.cornerRadius = 10
    }
    
    private func checkGenre() {
        
        self.spinner.isHidden = false
        
        let myUrl = URL(string: genre)
        var request = URLRequest(url: myUrl!)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                
                
                let JSONData = try JSONDecoder().decode(DetailGenreGames.self, from: data)
                
                self.games = JSONData.results ?? []
                
                DispatchQueue.main.async {
                    self.collectionSubview.reloadData()

                    self.spinner.isHidden = true
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
    }

}

extension BerandaCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let items = games[indexPath.item]
        delegate?.didBerandaPushed(id: items.id ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 90)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionSubview.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CatalougeOneCell
        guard let thumb = games[indexPath.row].imageBackground else { return UICollectionViewCell() }
        cell.itemImage.loadImage(using: thumb)
        
        cell.itemName.text = "Genres: \(games[indexPath.row].name ?? "")"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
}
