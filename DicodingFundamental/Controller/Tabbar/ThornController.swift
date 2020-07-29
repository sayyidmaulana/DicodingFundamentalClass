//
//  ThornController.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

class ThornController: UIViewController {

        fileprivate let container: UIView = {
            let v = UIView()
            v.backgroundColor = .white
            return v
        }()
        
        let itemImage = UIImageView()
        let itemName = UILabel()
        let itemMail = UILabel()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = ColorTheme.info
            navigationItem.titleView = titleStackView
            bindData()
        }
        
        lazy var titleStackView: UIStackView = {
            let titleLabel = UILabel()
            titleLabel.textAlignment = .center
            titleLabel.text = "Announcement"
            titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
            titleLabel.tag = 0
            $0.addArrangedSubview(titleLabel)
            let subtitleLabel = UILabel()
            subtitleLabel.textAlignment = .center
            subtitleLabel.text = "Another weirds content"
            subtitleLabel.font = UIFont.italicSystemFont(ofSize: 10)
            subtitleLabel.tintColor = ColorTheme.darkGray
            subtitleLabel.tag = 1
            $0.addArrangedSubview(subtitleLabel)
            let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
            stackView.axis = .vertical
            return stackView
        }(UIStackView())
        
        private func bindData() {
            setupView()
            setLibrary()
        }
        
        private func setupView() {

            view.addSubview(itemImage)
            itemImage.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 20, paddingLeft: 35, paddingBottom: 0, paddingRight: 35, width: 0, height: 120)

            view.addSubview(container)
            container.addSubview(itemName)
            container.addSubview(itemMail)
            container.setAnchor(top: itemImage.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 150)
            Utilities.shadow(controller: self, yourView: container)
            Utilities.cornerRadius10(controller: self, yourView: container)
            itemName.setAnchor(top: container.topAnchor, left: container.leadingAnchor, bottom: nil, right: container.trailingAnchor, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 0, height: 0)
            itemMail.setAnchor(top: itemName.bottomAnchor, left: container.leadingAnchor, bottom: nil, right: container.trailingAnchor, paddingTop: 20, paddingLeft: 30, paddingBottom: 0, paddingRight: 30, width: 0, height: 0)

        }
        
        func setLibrary() {
            itemImage.setObject{_ in
                itemImage.clipsToBounds = true
                itemImage.layer.cornerRadius = 30
                itemImage.image = #imageLiteral(resourceName: "sungaisusu")
            }
            itemName.setObject{_ in
                itemName.font = UIFont.systemFont(ofSize: 12)
                itemName.textAlignment = .left
                itemName.text = "Cooming Soon"
            }
            itemMail.setObject{_ in
                itemMail.font = UIFont.italicSystemFont(ofSize: 12)
                itemMail.textAlignment = .left
                itemMail.textColor = ColorTheme.darkGray
                itemMail.numberOfLines = 10
                itemMail.text = "Wait for another fun of us!"
            }
        }

    }
