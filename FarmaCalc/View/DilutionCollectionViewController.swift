//
//  DilutionCollectionViewController.swift
//  FarmaCalc
//
//  Created by Breno Rezende on 02/07/21.
//

import UIKit

class DilutionViewController: UIViewController {
    
    override func loadView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        view = DilutionCollectionView(frame: .zero, collectionViewLayout: layout)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
