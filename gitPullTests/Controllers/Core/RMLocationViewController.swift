//
//  RMLocationViewController.swift
//  gitPullTests
//
//  Created by Ekrem on 28.12.2022.
//

import UIKit

class RMLocationViewController: UIViewController {
    
    private let primaryView = RMLocationView()
    
    
    private let viewModel = RMLocationViewViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(primaryView)
        view.backgroundColor = .systemBackground
        title = "Locations"
        addSearchButton()
        addConstraints()
    }
    

    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
        
    }
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
        
            primaryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            primaryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            primaryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            primaryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
       
        
        ])
    }
    
    
    @objc private func didTapSearch() {
        
    }
   
}
