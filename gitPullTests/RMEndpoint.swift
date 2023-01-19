//
//  RMEndpoint.swift
//  gitPullTests
//
//  Created by Ekrem on 30.12.2022.
//

import Foundation

/// REPRESENTS  API ENDPOINT

@frozen enum RMEndpoint: String, CaseIterable, Hashable {
    case character
    case location
    case episode
    
}

