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
    
    private var searchResultHandler: (() -> Void)?
    //init
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
    
    // public
    
    public func registerSearchResultHandler(_ block: @escaping () -> Void) {
        self.searchResultHandler = block
    }
    
    public func executeSearch() {
        searchText = "rick"
        
        // arguments
        
        var queryParams: [URLQueryItem] = [
            URLQueryItem(name: "name", value: searchText)
        ]
        
       
        //add options
        
        queryParams.append(contentsOf: optionMap.enumerated().compactMap({ _, element in
            let key: RMSearchinputViewViewModel.DynamicOption = element.key
            let value: String = element.value
            return URLQueryItem(name: key.queryArgument, value: value)
        }))
        
        // requests
        
        let request = RMRequest(endpoint: config.type.endpoint,
                                queryParameters: queryParams)
        print(request.url?.absoluteString)
        
  
        RMService.shared.execute(request, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Search results found: \(model.results.count)")
            case .failure:
                break
            }
        }
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
