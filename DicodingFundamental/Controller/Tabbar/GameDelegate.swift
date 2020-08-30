//
//  GameDelegate.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 30/08/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

extension GameController: GameProtocol {

    func favTapped() {
        Utilities.showAlert(controller: self, message: "Your favorite game added!", seconds: 1)
    }
    
}
