//
//  RMEpisodeDetailViewController.swift
//  gitPullTests
//
//  Created by Ekrem on 19.01.2023.
//

import UIKit

// VIEW CONTROLLER TO SHOW DETAIS ---

final class RMEpisodeDetailViewController: UIViewController {

    private let viewModel: RMEpisodeDetailViewViewModel
    
    // INITS ---
    
    init(url: URL?) {
        self.viewModel = .init(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //// LIFECYCLES ---
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.backgroundColor = .systemBlue
    }
}
