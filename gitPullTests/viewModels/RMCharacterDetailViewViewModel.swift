//
//  RMCharacterDetailViewViewModel.swift
//  gitPullTests
//
//  Created by Ekrem on 10.01.2023.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    
    enum SectionType: CaseIterable {
        case photo
        case information
        case episode
    }
    
    public let sections = SectionType.allCases
    
    init(character: RMCharacter) {
        self.character = character
        }
    
    private var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    public var title: String {
        character.name.uppercased()
    }
    
 
    
}
