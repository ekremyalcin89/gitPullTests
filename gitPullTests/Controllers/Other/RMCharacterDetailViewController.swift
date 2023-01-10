//
//  RMCharacterDetailViewController.swift
//  gitPullTests
//
//  Created by Ekrem on 10.01.2023.
//

import UIKit

class RMCharacterDetailViewController: UIViewController {

    private let viewModel: RMCharacterDetailViewViewModel
    
    init(viewModel: RMCharacterDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
        
        
    }
    


}
