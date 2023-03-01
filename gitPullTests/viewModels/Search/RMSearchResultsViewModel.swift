//
//  RMSearchResultsViewModel.swift
//  gitPullTests
//
//  Created by Ekrem on 1.03.2023.
//

import Foundation


enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMEpisodeInfoCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
    
    
}
