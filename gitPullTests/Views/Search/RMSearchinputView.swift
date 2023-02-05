//
//  RMSearchinputView.swift
//  gitPullTests
//
//  Created by Ekrem on 1.02.2023.
//

import UIKit

protocol RMSearchInputViewDelegate: AnyObject {
    func rmSearchInputView(_ inputView: RMSearchinputView, didSelectOption option: RMSearchinputViewViewModel.DynamicOption)
}

final class RMSearchinputView: UIView {
    
    weak var delegate: RMSearchInputViewDelegate?
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search Here"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()

    private var viewModel: RMSearchinputViewViewModel? {
        didSet {
            guard let viewModel = viewModel, viewModel.hasDynamicOptions else {
                return
            }
            let options = viewModel.options
            createOptionSelectionViews(options: options)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(searchBar)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
        
            searchBar.topAnchor.constraint(equalTo: topAnchor),
            searchBar.leftAnchor.constraint(equalTo: leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: rightAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 60),
            
        
        ])
    }
    
    private func createOptionStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 9
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
        return stackView
        
    }
    
    private func createOptionSelectionViews(options: [RMSearchinputViewViewModel.DynamicOption]) {
      let stackView = createOptionStackView()
        for x in 0..<options.count {
            let option = options[x]
            let button = createButton(with: option, tag:x)
            stackView.addArrangedSubview(button)
        }
    }
    
    private func createButton(with option: RMSearchinputViewViewModel.DynamicOption, tag: Int) -> UIButton {
        let button = UIButton()
        
        button.setAttributedTitle(NSAttributedString(
                                                     string: option.rawValue,
                                                     attributes: [
                                                        .font: UIFont.systemFont(ofSize: 18, weight: .medium),
                                                        .foregroundColor: UIColor.label
                                                     ]
                                                ),
                                  for: .normal
                                  )
        
        button.backgroundColor = .secondarySystemFill
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        button.tag = tag
        button.layer.cornerRadius = 6

        return button
    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        guard let options = viewModel?.options else {
            return
        }
        let tag = sender.tag
        let selected = options[tag]
        delegate?.rmSearchInputView(self, didSelectOption: selected)
    }
    
    public func configure(with viewModel: RMSearchinputViewViewModel) {
        searchBar.placeholder = viewModel.searchPlaceholderText
        self.viewModel = viewModel
    }

    public func presentKeyboard() {
        searchBar.becomeFirstResponder()
    }
}

