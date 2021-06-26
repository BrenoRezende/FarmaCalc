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
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "mainNavBarColor")

        UINavigationBar.appearance().tintColor = .label
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().isTranslucent = false
        
        return navController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
}
