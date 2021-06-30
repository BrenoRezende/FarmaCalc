//
//  HomeListView.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 25/06/21.
//

import UIKit

struct HomeViewDTO {
    let title: String
}

class HomeTableView: UITableView {
    
    private var dto: [HomeViewDTO]?
    private var colors: [UIColor]?
    
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
    
    func set(dto: [HomeViewDTO]) {
        self.dto = dto
        self.colors = []
        for _ in dto {
            if let color = UIColor.allCustomColors.randomElement() as? UIColor {
                colors?.append(color)
            }
        }
        reloadData()
    }
    
    private func setup() {
        backgroundColor = .secondarySystemBackground
        contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        separatorStyle = .none
        register(HomeTableCell.self, forCellReuseIdentifier: HomeTableCell.reuseIdentifier)
        delegate = self
        dataSource = self
    }
}

extension HomeTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dto?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableCell.reuseIdentifier, for: indexPath) as? HomeTableCell else { return UITableViewCell() }
        
        if let line = dto?[indexPath.row] {
            let color = colors?[indexPath.row]
            cell.set(title: line.title, backgroundColor: color)
        }
        
        return cell
    }
}
