//
//  DetailBerandaController.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

class DetailBerandaController: UIViewController {
    
   var genreId = ""
    var genreDetails: DetailGenre? = nil
    
    lazy var imgMenu: UIImageView = {
        let imgViewMenu = UIImageView()
        imgViewMenu.contentMode = .scaleAspectFit
        return imgViewMenu
    }()
    let textMenu: UILabel = {
        let textViewMenu = UILabel()
        textViewMenu.textAlignment = .center
        textViewMenu.font = UIFont.systemFont(ofSize: 12)
        textViewMenu.text = ""
        textViewMenu.numberOfLines = 50
        return textViewMenu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorTheme.redSweet
    
        setupView()
        
        setData()
    }
    
    private func setupView() {
        view.addSubview(imgMenu)
        imgMenu.setAnchor(top: view.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width * 8 / 2, height: 300)
        view.addSubview(textMenu)
        textMenu.setAnchor(top: imgMenu.bottomAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, paddingTop: 30, paddingLeft: 30, paddingBottom: 20, paddingRight: 30, width: 0, height: 0)
    }

    private func setData() {

        
        let myUrl = URL(string: filterGenre(genre_id: genreId))
        var request = URLRequest(url: myUrl!)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                
                
                let JSONData = try JSONDecoder().decode(DetailGenre.self, from: data)
                self.genreDetails = JSONData
    
                DispatchQueue.main.async {

                    guard let thumb = self.genreDetails?.imageBackground else { return }
                    self.imgMenu.loadImage(using: thumb)
                    self.textMenu.text = self.genreDetails?.detailGenreDescription

                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
    }
    
}
