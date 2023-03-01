//
//  RMSearchView.swift
//  gitPullTests
//
//  Created by Ekrem on 1.02.2023.
//

import UIKit

protocol RMSearchViewDelegate: AnyObject {
    func rmSearchView(_ searchView: RMSearchView, didSelectOption option: RMSearchinputViewViewModel.DynamicOption)
}

final class RMSearchView: UIView {

    weak var delegate: RMSearchViewDelegate?
    
    private let viewModel: RMSearchViewViewModel
    
    private let searchInputView = RMSearchinputView()
    
    private let noResultsView = RMNoSearchResultView()
    
    init(frame: CGRect, viewModel: RMSearchViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(noResultsView, searchInputView)
        addConstraints()
        
        searchInputView.configure(with: RMSearchinputViewViewModel(type: viewModel.config.type))
        searchInputView.delegate = self
        
        viewModel.registerOptionChangeBlock { tuple in
            self.searchInputView.update(option: tuple.0, value: tuple.1)

        }
        
        viewModel.registerSearchResultHandler { results in
            print(results)
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
       NSLayoutConstraint.activate([

        //SEARCH INPUT VIEW

        searchInputView.topAnchor.constraint(equalTo: topAnchor),
        searchInputView.leftAnchor.constraint(equalTo: leftAnchor),
        searchInputView.rightAnchor.constraint(equalTo: rightAnchor),
        searchInputView.heightAnchor.constraint(equalToConstant: viewModel.config.type == .episode ? 55 : 110),

        
        
        
        
        
        //NO RESULTS
           noResultsView.widthAnchor.constraint(equalToConstant: 150),
           noResultsView.heightAnchor.constraint(equalToConstant: 150),
           noResultsView.centerXAnchor.constraint(equalTo: centerXAnchor),
           noResultsView.centerYAnchor.constraint(equalTo: centerYAnchor),

    ])
    }
 
    public func presentKeyboard() {
        searchInputView.presentKeyboard()
    }
    
}
///COLLECTION VIEW

extension RMSearchView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension RMSearchView: RMSearchInputViewDelegate {
    func rmSearchInputView(_ inputView: RMSearchinputView, didSelectOption option: RMSearchinputViewViewModel.DynamicOption) {
        delegate?.rmSearchView(self, didSelectOption: option)
    }
    
    func rmSearchInputView(_ inputView: RMSearchinputView, didChangeSearchText text: String) {
        viewModel.set(query: text)
    }
    
    func rmSearchInputViewDidTapSearchKeyboardButton(_ inputView: RMSearchinputView) {
        viewModel.executeSearch()
    }
}
