//
//  RMSearchView.swift
//  gitPullTests
//
//  Created by Ekrem on 1.02.2023.
//

import UIKit

final class RMSearchView: UIView {

    private let viewModel: RMSearchViewViewModel
    
    
    
    
    private let noResultsView = RMNoSearchResultView()
    
    
    
    init(frame: CGRect, viewModel: RMSearchViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(noResultsView)
        addConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
       NSLayoutConstraint.activate([

           noResultsView.widthAnchor.constraint(equalToConstant: 150),
           noResultsView.heightAnchor.constraint(equalToConstant: 150),
           noResultsView.centerXAnchor.constraint(equalTo: centerXAnchor),
           noResultsView.centerYAnchor.constraint(equalTo: centerYAnchor),

    ])
    }
 

}
///COLLECTIN VIEW

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
