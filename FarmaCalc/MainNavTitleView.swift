//
//  MainNavBar.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 20/06/21.
//

import UIKit

protocol MainNavTitleViewDelegate {
    func addButtonTapped()
}

class MainNavTitleView: UIView {
    
    //MARK: =============== Properties ===============
    
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    } 

    var delegate: MainNavTitleViewDelegate?
    
    //MARK: =============== Views ===============
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor(named: "mainTitleColor")
        label.font = UIFont(name: "DancingScript-Regular_Bold", size: 24)
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = UIColor(named: "mainSubtitleColor")
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .leading
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = UIColor(named: "pastelGreenTintColor")
        button.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: =============== Constructor ===============
    
    init(title: String, subtitle: String) {
        super.init(frame: .zero)
        setup()
        set(title: title, subtitle: subtitle)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
}

extension MainNavTitleView {
    
    //MARK: =============== Setup ===============
    
    func set(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle.uppercased()
    }
    
    @objc private func addTapped(_ sender: UIButton) {
        delegate?.addButtonTapped()
    }
    
    private func setup() {
        backgroundColor = .clear
        vStack.addArrangedSubview(subtitleLabel)
        vStack.addArrangedSubview(titleLabel)
        addSubview(vStack)
        addSubview(addButton)
        
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            vStack.topAnchor.constraint(greaterThanOrEqualTo: topAnchor),

            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            addButton.bottomAnchor.constraint(equalTo: vStack.bottomAnchor),
            addButton.leadingAnchor.constraint(greaterThanOrEqualTo: vStack.trailingAnchor, constant: 10)
        ])
    }
}
