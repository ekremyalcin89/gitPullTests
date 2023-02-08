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
    private var optionMap: [RMSearchinputViewViewModel.DynamicOption: String] = [:]
    private var searchText = ""
    
    private var optionMapUpdateBlock: (((RMSearchinputViewViewModel.DynamicOption, String)) -> Void)?
    
    
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
    
    public func executeSearch() {
        
    }
    
    public func set(query text: String) {
        self.searchText = text
    }
    
    public func set(value: String, for option: RMSearchinputViewViewModel.DynamicOption) {
        optionMap[option] = value
        let tuple = (option, value)
        optionMapUpdateBlock?(tuple)
    }

    public func registerOptionChangeBlock(_ block: @escaping ((RMSearchinputViewViewModel.DynamicOption, String)) -> Void) {
        self.optionMapUpdateBlock = block
    }
}
