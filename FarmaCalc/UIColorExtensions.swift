//
//  UIColorExtensions.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 17/06/21.
//

import UIKit

extension UIColor {
    
    class var allCustomColors: [UIColor?] {
        return [
            UIColor(named: "blueBellColor"),
            UIColor(named: "gardeniaColor"),
            UIColor(named: "lavenderColor"),
            UIColor(named: "mainNavBarColor"),
            UIColor(named: "mainSubtitleColor"),
            UIColor(named: "mainTitleColor"),
            UIColor(named: "pastelGreenColor"),
            UIColor(named: "pastelGreenTintColor"),
            UIColor(named: "peachColor"),
            UIColor(named: "pinkishPinkColor"),
            UIColor(named: "sweetGardenColor"),
        ]
    }
    
    public convenience init?(hex: String) {
        let r, g, b: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: 1.0)
                    return
                }
            }
        }
        
        return nil
    }
}
