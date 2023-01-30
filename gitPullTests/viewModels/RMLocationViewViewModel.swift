//
//  RMLocationViewViewModel.swift
//  gitPullTests
//
//  Created by Ekrem on 30.01.2023.
//

import Foundation

final class RMLocationViewViewModel {
    
    private var location: [RMLocation] = []

    
    private var cellViewModels: [String] = []
    
    init() { }
    
    
    
    public func fetchLocations() {
        RMService.shared.execute(.listLocationsRequest, expecting: String.self) { result in
            switch result {
            case .success(let model):
                break
            case.failure(let error):
                break
            }
            
        }
    }
    
    private var hasMoeResults: Bool {
        return false
    }
    
    
}
