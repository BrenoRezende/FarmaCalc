//
//  HomeTableCell.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 25/06/21.
//

import UIKit

class HomeTableCell: UITableViewCell {
    
    static var reuseIdentifier: String = "home_table_cell_id"
        
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "mainTitleColor")
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var containerView: UIView = {
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
    
    func set(title: String, backgroundColor: UIColor?) {
        titleLabel.text = title
        if let color = backgroundColor {
            containerView.backgroundColor = color
        }
    }
    
    private func setup() {
        backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        contentView.addSubview(containerView)
        
        titleLabel.fill(top: contentView.topAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, andEdgeInsets: UIEdgeInsets(top: 5, left: 16, bottom: 0, right: 16))
        containerView.fill(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: contentView.bottomAnchor, right: titleLabel.rightAnchor, andEdgeInsets: UIEdgeInsets(top: 10, left: 0, bottom: 5, right: 0))
    }
}


