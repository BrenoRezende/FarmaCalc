//
//  HomeViewController.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 17/06/21.
//

import UIKit
import SwiftUI

#if HG
    let navTitle = "FarmaCalc HG"
#else
    let navTitle = "FarmaCalc"
#endif

protocol AnyHomeView: AnyObject {
    func showSavedCalculations(dto: [HomeViewDTO])
}

class HomeViewController: UIViewController, AnyHomeView {
    
    private lazy var mainNavBar: MainNavTitleView = {
        let view = MainNavTitleView(title: navTitle, subtitle: "medicine calculator")
        view.delegate = self
        return view
    }()
    
    var presenter: AnyHomePresenter!
    
    override func loadView() {
        view = HomeTableView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension HomeViewController {
    
    private func setup() {
        navigationItem.titleView = mainNavBar
        presenter.getSavedCalculations()
    }
    
    func showSavedCalculations(dto: [HomeViewDTO]) {
        if let view = view as? HomeTableView {
            view.set(dto: dto)
        }
    }
}

extension HomeViewController: MainNavTitleViewDelegate {
    func addButtonTapped() {
        presenter.addButtonTapped()
    }
}

//struct HomeViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        IntegratedController<HomeViewController>().edgesIgnoringSafeArea(.vertical)
//    }
//}
