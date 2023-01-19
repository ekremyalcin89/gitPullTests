//
//  RMEpisodeDetailViewController.swift
//  gitPullTests
//
//  Created by Ekrem on 19.01.2023.
//

import UIKit

// VIEW CONTROLLER TO SHOW DETAIS ---

final class RMEpisodeDetailViewController: UIViewController {

    private let url: URL?
    
    // INITS ---
    
    init(url: URL?) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // LIFE CYCLES ---
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.backgroundColor = .systemBlue
    }
}
