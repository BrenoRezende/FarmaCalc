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
    
    override func loadView() {
        view = HomeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension HomeViewController {
    
    private func setup() {
        title = navTitle
        let newCalcButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCalc))
        navigationItem.rightBarButtonItem = newCalcButton
    }
    
    @objc func addCalc() {
        let controller = UIViewController()
        controller.view.backgroundColor = .systemGreen
        let transitionDelegate = SPStorkTransitioningDelegate()
        controller.transitioningDelegate = transitionDelegate
        controller.modalPresentationStyle = .custom
        controller.modalPresentationCapturesStatusBarAppearance = true
        self.present(controller, animated: true, completion: nil)
    }
}

struct HomeViewController_Previews: PreviewProvider {
    static var previews: some View {
        IntegratedController<HomeViewController>().edgesIgnoringSafeArea(.vertical)
    }
}
