//
//  RMLocationViewController.swift
//  gitPullTests
//
//  Created by Ekrem on 28.12.2022.
//

import UIKit

class RMLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Locations"
        addSearchButton()
    }
    

    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
        
    }
    @objc private func didTapSearch() {
        
    }
   
}
