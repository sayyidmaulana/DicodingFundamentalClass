//
//  DetailBerandaViewController.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit
import WebKit
import CoreData

class DetailBerandaViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var webViewTemp = ""
    var gamesId = ""
    var titleGames = ""
    var release = ""
    var rating = 0
    var image = ""
    var gamesDetails: DetailsGamesView? = nil
    
    var gameData: Result? = nil
    var dataGame = [Result]()
    lazy var gamesProvider: FavoriteGamesProvider = { return FavoriteGamesProvider() }()
    var there = false
    
    var spinner = UIActivityIndicatorView(style: .large)
    
     lazy var love: UIButton = {
        let button = UIButton(type: .system)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 5.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.setImage(#imageLiteral(resourceName: "favourite"), for: .normal)
        button.tintColor = ColorTheme.redSweet
        button.addTarget(self, action: #selector(self.fav), for: .touchUpInside)
        return button
    }()
     lazy var loveButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        button.layer.shadowRadius = 5.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.setImage(#imageLiteral(resourceName: "favourite"), for: .normal)
        button.tintColor = ColorTheme.facebook
        button.addTarget(self, action: #selector(self.fav), for: .touchUpInside)
        return button
    }()
    
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        return webView
    }()
    
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
        view.backgroundColor = .white
        setupView()
        setData()
        database()
    }
    
    private func setupView() {
        self.navigationItem.title = gamesDetails?.name
        view.addSubview(imgMenu)
        imgMenu.setAnchor(top: view.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 18, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width * 8 / 2, height: 300)

        view.addSubview(textMenu)
        textMenu.setAnchor(top: imgMenu.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 30, paddingLeft: 30, paddingBottom: 20, paddingRight: 30, width: 0, height: 0)
        view.addSubview(webView)
        webView.setAnchor(top: textMenu.bottomAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        spinner.startAnimating()
        view.addSubview(spinner)
        spinner.setAnchor(top: view.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 150, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 0, height: 0)
    }
    
    private func database() {
        gamesProvider.getAllData { (dataGame) in
            let id = Int(self.gamesId) ?? 0
            for x in 0 ..< dataGame.count {
                if id == dataGame[x].id {
                    self.there = true
                }
            }
            
                if self.there {
                DispatchQueue.main.async {
                    let imageContent = UIImage(systemName: "love")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                    let button = UIBarButtonItem(image: imageContent, style: .plain, target: self, action: #selector(self.fav))
                    self.navigationItem.rightBarButtonItem = button
                    }
                } else {
                DispatchQueue.main.async {
                    let contentImage = UIImage(systemName: "favourite")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                    let button = UIBarButtonItem(image: contentImage, style: .plain, target: self, action: #selector(self.fav))
                    self.navigationItem.rightBarButtonItem = button
                    }
                }
            
            if self.there {
            DispatchQueue.main.async {
                self.view.addSubview(self.love)
                self.love.setAnchor(top: self.imgMenu.topAnchor, left: nil, bottom: nil, right: self.imgMenu.trailingAnchor, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 28, width: 40, height: 40)
                }
            } else {
                DispatchQueue.main.async {
                self.view.addSubview(self.loveButton)
            self.loveButton.setAnchor(top: self.imgMenu.topAnchor, left: nil, bottom: nil, right: self.imgMenu.trailingAnchor, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 28, width: 40, height: 40)
                }
            }
            
        }
    }

    private func setData() {

        self.spinner.isHidden = false
        let myUrl = URL(string: filterGames(games_id: gamesId))
        var request = URLRequest(url: myUrl!)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                
                
                let JSONData = try JSONDecoder().decode(DetailsGamesView.self, from: data)
                self.gamesDetails = JSONData
    
                DispatchQueue.main.async {

                    guard let thumb = self.gamesDetails?.background_image else { return }
                    self.imgMenu.loadImage(using: thumb)
                    self.textMenu.text = "Description:"
                    self.gamesId = "\(self.gamesDetails?.id ?? 0)"
                    self.title = self.gamesDetails?.name
                    self.webViewTemp = self.gamesDetails?.description ?? ""
                    self.webView.loadHTMLString(self.webViewTemp, baseURL: .none)
                    self.webView.allowsBackForwardNavigationGestures = true
                    self.webView.configuration.preferences.javaScriptEnabled = true
                    self.webView.navigationDelegate = self
                      self.spinner.isHidden = true
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
            }.resume()
    }
    
    @objc func fav() {
        if !there {
            
            gamesProvider.createData(gamesDetails?.id ?? 0, gamesDetails?.name ?? "", gamesDetails?.released ?? "", gamesDetails?.background_image ?? "", gamesDetails?.ratings_count ?? 0) {
                DispatchQueue.main.async {
                    Utilities.showAlert(controller: self, message: "Data berhasil disimpan !", seconds: 1)
                    self.there = true
                }
            }

        } else {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "FavoriteModel")
            
            do {
                let dataToDelete = try context.fetch(fetchRequest)[0] as! NSManagedObject
                context.delete(dataToDelete)
                
                try context.save()
                Utilities.showAlert(controller: self, message: "Your games removed !", seconds: 1)
                DispatchQueue.main.async {
                    self.there = false
                }
                
            } catch {
                Utilities.showAlert(controller: self, message: "Fail to remove your game !", seconds: 1)
            }
        }
    }
    
}
