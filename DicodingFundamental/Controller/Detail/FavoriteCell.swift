//
//  FavoriteCell.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/09/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit
import CoreData

class FavoriteCell: UICollectionViewCell {
    
    var data: Result? = nil
    
    lazy var itemImage = UIImageView()
    let itemName = UILabel()
    let itemDate = UILabel()
    let itemRate = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        cellShadow()
        setupView()
        setLibrary()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func cellShadow() {
        self.backgroundColor = .white
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 3.0
        self.layer.cornerRadius = 10
    }
    
    private func setupView() {
        addSubview(itemImage)
        itemImage.setAnchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 120, height: 100)
        addSubview(itemName)
        addSubview(itemDate)
        addSubview(itemRate)
        itemName.setAnchor(top: topAnchor, left: itemImage.trailingAnchor, bottom: nil, right: trailingAnchor, paddingTop: 15, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 0)
        itemDate.setAnchor(top: itemName.bottomAnchor, left: itemImage.trailingAnchor, bottom: nil, right: trailingAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 0)
        itemRate.setAnchor(top: itemDate.bottomAnchor, left: itemImage.trailingAnchor, bottom: nil, right: trailingAnchor, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 0)
        
    }
    
    func setData(data: Result) {
        guard let thumb = data.backgroundImage else { return }
        let rating = data.ratingsCount ?? 0
        let release = data.released ?? ""
        
        itemImage.loadImage(using: thumb)
        itemName.text = data.name
        itemDate.text = release
        itemRate.text = "\(rating)"
        print(data.backgroundImage ?? "")
        print(data.name ?? "")
        print(data.released ?? "")
    }
    
    private func setLibrary() {
        itemImage.setObject{_ in
            itemImage.clipsToBounds = true
            itemImage.layer.cornerRadius = 10
        }
        itemName.setObject{_ in
            itemName.font = UIFont.systemFont(ofSize: 12)
            itemName.textAlignment = .left
        }
        itemDate.setObject{_ in
            itemDate.font = UIFont.systemFont(ofSize: 12)
            itemDate.textAlignment = .left
        }
        itemRate.setObject{_ in
            itemRate.font = UIFont.systemFont(ofSize: 12)
            itemRate.textAlignment = .left
        }
    }
    
}
