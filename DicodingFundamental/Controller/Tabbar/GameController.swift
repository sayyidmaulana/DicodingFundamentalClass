//
//  GameController.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 27/08/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

private let identifier = "Cell"

class GameController: UIViewController {
    
    var games : [Result] = []
    
    var spinner = UIActivityIndicatorView(style: .large)
    
    lazy var titleStackView: UIStackView = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.text = "Catalouge"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.tag = 0
        $0.addArrangedSubview(titleLabel)
        let subtitleLabel = UILabel()
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "List of the Game"
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
        navigationItem.titleView = titleStackView
        let customImage = UIImage(named: "favourite")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let btnImage = UIBarButtonItem(image: customImage, style: .plain, target: self, action: #selector(self.fav))
        navigationItem.rightBarButtonItem = btnImage
        let dev = UIImage(named: "dev")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let btnDev = UIBarButtonItem(image: dev, style: .plain, target: self, action: #selector(self.dev))
        navigationItem.leftBarButtonItem = btnDev
        self.view.backgroundColor = .white
        setupView()
        cellShadow()
        checkGenre()
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
        collectionSubview.delegate = self
        collectionSubview.dataSource = self
        collectionSubview.register(GameCell.self, forCellWithReuseIdentifier: identifier)
        
        view.addSubview(collectionSubview)
        collectionSubview.setAnchor(top: view.topAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        spinner.startAnimating()
        view.addSubview(spinner)
        spinner.setAnchor(top: view.topAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, paddingTop: 250, paddingLeft: 50, paddingBottom: 0, paddingRight: 50, width: 0, height: 0)
    }
    
    private func cellShadow() {
        self.view.backgroundColor = .white
        self.view.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.layer.shadowOpacity = 0.3
        self.view.layer.shadowOffset = CGSize.zero
        self.view.layer.shadowRadius = 3.0
        self.view.layer.cornerRadius = 10
    }
    
    private func checkGenre() {
        
        self.spinner.isHidden = false
        
        let myUrl = URL(string: endPointGames)
        var request = URLRequest(url: myUrl!)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            
            do {
                
                
                let JSONData = try JSONDecoder().decode(Games.self, from: data)
                
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
    
    @objc func fav() {
        
    }
    
    @objc func dev() {
        
    }

}

extension GameController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailBerandaViewController()
        vc.gamesId = "\(games[indexPath.item].id ?? 0)"
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 8 * 4, height: 120)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionSubview.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! GameCell
        cell.delegate = self
        let game = games[indexPath.item]
        cell.setData(data: game)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
}
