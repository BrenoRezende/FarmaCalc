//
//  HomeTableCell.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 25/06/21.
//

import UIKit

class HomeTableCell: UITableViewCell {
    
    static var reuseIdentifier: String = "home_table_cell_id"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "mainTitleColor")
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor(named: "sweetGardenColor")
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
}

extension HomeTableCell {
    
    func set(title: String) {
        titleLabel.text = title
        if let color = UIColor.allCustomColors.randomElement() {
            containerView.backgroundColor = color
        }
    }
    
    private func setup() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        contentView.addSubview(containerView)
        
        titleLabel.fill(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, andEdgeInsets: UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0))
        containerView.fill(top: titleLabel.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, andEdgeInsets: UIEdgeInsets(top: 10, left: 0, bottom: 5, right: 0))
    }
}


