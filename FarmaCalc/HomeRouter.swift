//
//  HomeRouter.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 12/08/21.
//

import UIKit
import SPStorkController

typealias AnyHomeEntryPoint = AnyHomeView & UIViewController

protocol AnyHomeRouter {
    var view: AnyHomeEntryPoint? { get }
    
    static func start() -> AnyHomeRouter
    func goToDilutionView()
}

class HomeRouter: AnyHomeRouter {
    
    var view: AnyHomeEntryPoint?
    
    static func start() -> AnyHomeRouter {
        let router = HomeRouter()
        let vc = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        
        vc.presenter = presenter
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.view = vc
        
        return router
    }
    
    func goToDilutionView() {

        let controller = DilutionViewController()
        let transitionDelegate = SPStorkTransitioningDelegate()
        controller.transitioningDelegate = transitionDelegate
        controller.modalPresentationStyle = .custom
        controller.modalPresentationCapturesStatusBarAppearance = true
        view?.present(controller, animated: true, completion: nil)
    }
}
