//
//  HomeView.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 17/06/21.
//

import UIKit

class HomeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}

extension HomeView {
    
    private func setup() {
        backgroundColor = .init(hex: "#f2f5f5")
    }
}
