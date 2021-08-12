//
//  HomeInteractor.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 12/08/21.
//

import Foundation

protocol AnyHomeInteractorInput {
    func getSavedCalculations()
}

protocol AnyHomeInteractorOutput: AnyObject {
    func showSavedCalculations(dto: [HomeViewDTO])
}

class HomeInteractor: AnyHomeInteractorInput {
    
    weak var output: AnyHomeInteractorOutput?

    func getSavedCalculations() {
        let dto = [
            HomeViewDTO(title: "Sample calc"),
            HomeViewDTO(title: "Sample calc"),
            HomeViewDTO(title: "Sample calc"),
            HomeViewDTO(title: "Sample calc"),
            HomeViewDTO(title: "Sample calc"),
            HomeViewDTO(title: "Sample calc"),
        ]
        output?.showSavedCalculations(dto: dto)
    }
}
