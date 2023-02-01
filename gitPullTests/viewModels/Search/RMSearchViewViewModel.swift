//
//  RMSearchViewViewModel.swift
//  gitPullTests
//
//  Created by Ekrem on 1.02.2023.
//

import Foundation

/// SHOW SEARCH RESULTS ,
/// SHOW NO RESULTS,
/// KICK OFF API REQUESTS

final class RMSearchViewViewModel {
    let config: RMSearchViewController.Config
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
}
