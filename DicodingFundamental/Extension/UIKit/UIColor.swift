//
//  UIColor.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit

struct ColorTheme {
    
    static let colorPrimary = UIColor(netHex: 0xC5495A)
    static let colorPrimaryDark = UIColor(netHex: 0xC5495A)
    static let colorAccent = UIColor(netHex: 0xED8E9E)
    
    static let red = UIColor(netHex: 0xC5495A)
    static let redLight = UIColor(netHex: 0xED8E9E)
    static let redSweet = UIColor(netHex: 0xE8B2BA)
    static let darkRed = UIColor(netHex: 0xA43948)
    static let rose = UIColor(netHex: 0xDB1D3D)
    static let gray = UIColor(netHex: 0xABABAB)
    static let lightGray = UIColor(netHex: 0xE7E7E7)
    static let darkGray = UIColor(netHex: 0x838383)
    static let yellow = UIColor(netHex: 0xF8E71C)
    static let green = UIColor(netHex: 0x4CAF50)
    static let yellowYoung = UIColor(netHex: 0xFFF7C5)
    static let black = UIColor(netHex: 0x000000)
    static let white = UIColor(netHex: 0xFFFFFF)
    static let darkWhite = UIColor(netHex: 0xF1F1F1)
    
    static let link = UIColor(netHex: 0x2200CC)
    static let succsess = UIColor(netHex: 0xD3ECD9)
    static let succsessDark = UIColor(netHex: 0x9befaf)
    static let error = UIColor(netHex: 0xF8D7DA)
    static let warning = UIColor(netHex: 0xFFF2CD)
    static let info = UIColor(netHex: 0xCCE5FF)
    
    static let first = UIColor(netHex: 0x57FF7F)
    static let second = UIColor(netHex: 0xD44653)
    static let third = UIColor(netHex: 0xE6BE4C)
    static let fourth = UIColor(netHex: 0x4E7BD9)
    
    static let google = UIColor(netHex: 0xD34836)
    static let facebook = UIColor(netHex: 0x3C5A99)
    
    static let gradient_start_color = UIColor(netHex: 0x4c84ff)
    static let gradient_end_color = UIColor(netHex: 0x18a3fe)
    
    //    <!-- colors for tab and screent text -->
    
    static let tab_indicator_gray = UIColor(netHex: 0xc0c0c0)
    static let intro_title_color = UIColor(netHex: 0x000000)
    static let intro_description_color = UIColor(netHex: 0x656565)
    
    static let MainTheme = UIColor(netHex: 0x0076b6)
    static let TranslucentMainTheme = UIColor(white: 0x0076b6, alpha: 0.5)
    static let GuestBackground = UIColor(netHex: 0x84c664)
    static let OwnerBackground = UIColor(netHex: 0x979797)
    
}

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alphaChannel: CGFloat) {
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: alphaChannel)
    }
    
    convenience init(netHex: Int, alpha: CGFloat = 1.0) {
        self.init(red: (netHex >> 16) & 0xff,
                  green: (netHex >> 8) & 0xff,
                  blue: netHex & 0xff,
                  alphaChannel: alpha)
    }
    
    func toColor(_ color: UIColor, percentage: CGFloat) -> UIColor {
        let percentage = max(min(percentage, 100), 0) / 100
        switch percentage {
        case 0: return self
        case 1: return color
        default:
            var (r1, g1, b1, a1): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
            var (r2, g2, b2, a2): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
            guard self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1) else { return self }
            guard color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2) else { return self }
            
            return UIColor(red: CGFloat(r1 + (r2 - r1) * percentage),
                           green: CGFloat(g1 + (g2 - g1) * percentage),
                           blue: CGFloat(b1 + (b2 - b1) * percentage),
                           alpha: CGFloat(a1 + (a2 - a1) * percentage))
        }
    }
}
