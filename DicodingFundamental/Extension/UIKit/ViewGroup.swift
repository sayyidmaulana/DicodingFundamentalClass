//
//  ViewGroup.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

extension UIImageView {
    func setObject(completion: (UIImageView) -> Void) {
        completion(self)
    }
}

extension UILabel {
    func setObject(completion: (UILabel) -> Void) {
        completion(self)
    }
}
