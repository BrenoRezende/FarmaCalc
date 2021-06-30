//
//  HomeViewModel.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 20/06/21.
//

import Foundation

protocol IHomeViewModel {
    var dto: [HomeViewDTO] { get }
}

class HomeViewModel: IHomeViewModel {
    
    var dto: [HomeViewDTO] {
        return [
            HomeViewDTO(title: "Sample calc"),
            HomeViewDTO(title: "Sample calc"),
            HomeViewDTO(title: "Sample calc"),
            HomeViewDTO(title: "Sample calc"),
            HomeViewDTO(title: "Sample calc"),
            HomeViewDTO(title: "Sample calc"),
        ]
    }
}
