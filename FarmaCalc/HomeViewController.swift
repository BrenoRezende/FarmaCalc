//
//  HomeViewController.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 17/06/21.
//

import UIKit
import SwiftUI
import SPStorkController

#if HG
    let navTitle = "FarmaCalc HG"
#else
    let navTitle = "FarmaCalc"
#endif

class HomeViewController: UIViewController {
    
    private lazy var mainNavBar: MainNavTitleView = {
        let view = MainNavTitleView(title: navTitle, subtitle: "medicine calculator")
        view.delegate = self
        return view
    }()
    
    private let viewModel: IHomeViewModel
    
    init(viewModel: IHomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = HomeViewModel()
        super.init(coder: coder)
    }
    
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
        if let view = view as? HomeTableView {
            view.set(dto: viewModel.dto)
        }
    }
    
    @objc func addCalc() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let controller = DilutionCollectionViewController(collectionViewLayout: layout)
        let transitionDelegate = SPStorkTransitioningDelegate()
        controller.transitioningDelegate = transitionDelegate
        controller.modalPresentationStyle = .custom
        controller.modalPresentationCapturesStatusBarAppearance = true
        self.present(controller, animated: true, completion: nil)
    }
}

extension HomeViewController: MainNavTitleViewDelegate {
    func addButtonTapped() {
        addCalc()
    }
}

struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        IntegratedController<HomeViewController>().edgesIgnoringSafeArea(.vertical)
    }
}
