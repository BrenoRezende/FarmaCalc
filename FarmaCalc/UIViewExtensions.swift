//
//  NSLayoutConstraintExtensions.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 25/06/21.
//

import UIKit

extension UIView {
    
    func fill(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, andEdgeInsets edge: UIEdgeInsets? = nil) {
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: edge?.top ?? 0).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: edge?.left ?? 0).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -(edge?.bottom ?? 0)).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -(edge?.right ?? 0)).isActive = true
        }
    }
    
    func centerHorizontallyInSuperview() {
        guard let parent = superview else { return }
        self.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
    }
    
    func centerVerticallyInSuperview() {
        guard let parent = superview else { return }
        self.centerYAnchor.constraint(equalTo: parent.centerYAnchor).isActive = true
    }
    
}
