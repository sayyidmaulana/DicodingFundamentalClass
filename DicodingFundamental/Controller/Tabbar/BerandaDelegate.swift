//
//  BerandaDelegate.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

extension BerandaController: BerandaProtocol, BerandaViewProtocol, BerandaAnotherProtocol {

    func didBerandaAnotherPushed(id: Int) {
        let vc = DetailBerandaAnotherController()
        vc.devId = "\(id)"
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func didBerandaPushed(id: Int) {
        let vc = DetailBerandaController()
        vc.genreId = "\(id)"
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func didBerandaViewPushed(id: Int) {
        let vc = DetailBerandaViewController()
        vc.gamesId = "\(id)"
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
