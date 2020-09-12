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
    
    lazy var itemImage = UIImageView()
    let itemName = UILabel()
    let itemDate = UILabel()
    let itemRate = UILabel()
    
     lazy var loveButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 5.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.setImage(#imageLiteral(resourceName: "favourite"), for: .normal)
        button.tintColor = ColorTheme.redSweet

        return button
    }()
    
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
        addSubview(loveButton)
        loveButton.setAnchor(top: topAnchor, left: leadingAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 7, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
        
    }
    
    @objc private func move(){

    }
    
    func getData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteModel")
        //request.predicate = NSPredicate(format: "age = %@", "12") //example
        request.returnsObjectsAsFaults = false

        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "id") as! Int)
                print(data.value(forKey: "backgroundImage") as! String)
                print(data.value(forKey: "ratingsCount") as! Int)
                print(data.value(forKey: "released") as! String)
                print(data.value(forKey: "name") as! String)
                guard let thumb = data.value(forKey: "backgroundImage") else { return }
                itemImage.loadImage(using: thumb as? String ?? "")
                itemName.text = data.value(forKey: "name") as? String
                itemDate.text = data.value(forKey: "released") as? String
                itemRate.text = "\(data.value(forKey: "ratingsCount") as? Int ?? 0)"
            }
            
        } catch {
            
            print("Failed")
        }
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
