//
//  CatalougeThreeCell.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

class CatalougeThreeCell: UICollectionViewCell {
    
    lazy var itemImage = UIImageView()
    let itemName = UILabel()
    
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
        itemImage.setAnchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        addSubview(itemName)
        itemName.setAnchor(top: nil, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: -20, paddingRight: 30, width: 0, height: 0)
    }
    
    func setLibrary() {
        itemImage.setObject{_ in
            itemImage.clipsToBounds = true
            itemImage.layer.cornerRadius = 10
        }
        itemName.setObject{_ in
            itemName.font = UIFont.systemFont(ofSize: 12)
            itemName.textAlignment = .left
        }
    }
    
}
