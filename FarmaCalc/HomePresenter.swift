//
//  HomePresenter.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 12/08/21.
//

import Foundation

protocol AnyHomePresenter: AnyObject {
    func getSavedCalculations()
    func addButtonTapped()
}

class HomePresenter: AnyHomePresenter {
    
    weak var view: AnyHomeView?
    var router: AnyHomeRouter!
    var interactor: AnyHomeInteractorInput!
    
    func getSavedCalculations() {
        interactor.getSavedCalculations()
    }
    
    func addButtonTapped() {
        router.goToDilutionView()
    }
}

extension HomePresenter: AnyHomeInteractorOutput {
    func showSavedCalculations(dto: [HomeViewDTO]) {
        view?.showSavedCalculations(dto: dto)
    }
}
