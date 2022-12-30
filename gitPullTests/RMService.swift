//
//  RMService.swift
//  gitPullTests
//
//  Created by Ekrem on 30.12.2022.
//

import Foundation

final class RMService {
    static let shared = RMService()
    
    private init() {}
    
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
    
}
