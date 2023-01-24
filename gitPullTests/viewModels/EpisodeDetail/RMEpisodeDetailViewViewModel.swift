//
//  RMEpisodeDetailViewViewModel.swift
//  gitPullTests
//
//  Created by Ekrem on 19.01.2023.
//

import UIKit

protocol RMEpisodeDetailViewViewModelDelegate: AnyObject {
    func didFetchEpisodeDetails()
}

final class RMEpisodeDetailViewViewModel {
    private let endpointUrl: URL?
    private var dataTuple: (RMEpisode, [RMCharacter])? {
        didSet {
            delegate?.didFetchEpisodeDetails()
        }
    }
    
    enum sectionType {
        case information(viewModels: [RMEpisodeInfoCollectionViewCellViewModel])
        case characters(viewModel: [RMCharacterCollectionViewCellViewModel])
    }
    
    public weak var delegate: RMEpisodeDetailViewViewModelDelegate?
    
    public private(set) var sections: [sectionType] = []
    
   
    /// INITS
    
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
    
    }
    
    
    ///FETCHING EPISODE
    public func fetchEpisodeData() {
        guard let url = endpointUrl,
                let request = RMRequest(url: url) else {
            return
        }
        
        RMService.shared.execute(request, expecting: RMEpisode.self) { [weak self] result in
            
                switch result {
                case .success(let model):
                    self?.fetchRelatedCharacters(episode: model)
                case .failure:
                    break
            }
        }
    }
    
    private func fetchRelatedCharacters(episode: RMEpisode) {
        let requests: [RMRequest] = episode.characters.compactMap({
            return URL(string: $0)
        }).compactMap({
            return RMRequest(url: $0)
        })
        
        let group = DispatchGroup()
        var characters: [RMCharacter] = []
        for request in requests {
            group.enter()
            RMService.shared.execute(request, expecting: RMCharacter.self) { result in
                defer {
                    group.leave()
                }
                switch result {
                case .success(let model):
                    characters.append(model)
                case .failure:
                    break
                }
            }
        }
        
        group.notify(queue: .main) {
            self.dataTuple = (
                episode,
                characters
            )
        }
    }
}
