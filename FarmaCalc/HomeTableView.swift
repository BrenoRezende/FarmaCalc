//
//  HomeListView.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 25/06/21.
//

import UIKit

class HomeTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}

extension HomeTableView {
    
    private func setup() {
        backgroundColor = .secondarySystemBackground
        separatorStyle = .none
        register(HomeTableCell.self, forCellReuseIdentifier: HomeTableCell.reuseIdentifier)
    }
    
}
