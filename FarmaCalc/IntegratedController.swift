//
//  HomeIntegratedController.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 18/06/21.
//

import SwiftUI

struct IntegratedController<T: UIViewController>: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let navController = UINavigationController(rootViewController: T())
        navController.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        UINavigationBar.appearance().tintColor = .label
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        return navController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}
