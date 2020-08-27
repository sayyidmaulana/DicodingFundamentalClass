//
//  TabbarController.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstTabbar = GameController()
        let firstController = UINavigationController(rootViewController: firstTabbar)
        let berandaItem:UITabBarItem = UITabBarItem(title: "Games", image: UIImage(named: "home")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "home"))
        firstController.tabBarItem = berandaItem
        
        let secondTabbar = GenreController()
        let secondController = UINavigationController(rootViewController: secondTabbar)
        let thornItem:UITabBarItem = UITabBarItem(title: "Genres", image: UIImage(named: "thorn")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "thorn"))
        secondController.tabBarItem = thornItem
        
        let thirdTabbar = AboutController()
        let thirdController = UINavigationController(rootViewController: thirdTabbar)
        let aboutItem:UITabBarItem = UITabBarItem(title: "About", image: UIImage(named: "about")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "about"))
        thirdController.tabBarItem = aboutItem

        viewControllers = [firstController, secondController, thirdController]
        navigationController?.navigationBar.isTranslucent = false

    }

}

