//
//  RMSettingsViewController.swift
//  gitPullTests
//
//  Created by Ekrem on 28.12.2022.
//

import StoreKit
import SafariServices
import SwiftUI
import UIKit

class RMSettingsViewController: UIViewController {
    
    
    
    
    private var settingsSwiftUIController: UIHostingController<RMSettingsView>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Settings"
        addSwiftUIController()
    }
    
    private func addSwiftUIController() {
        let settingsSwiftUIController = UIHostingController(
           rootView: RMSettingsView(
           viewModel: RMSettingsViewViewModel(
               cellViewModels: RMSettingsOption.allCases.compactMap({
                   return RMSettingsCellViewModel(type: $0) { [weak self] option in
                       self?.handleTap(option: option)
                   }
               })
             )
          )
       )
        addChild(settingsSwiftUIController)
        settingsSwiftUIController.didMove(toParent: self)
        
        view.addSubview(settingsSwiftUIController.view)
        settingsSwiftUIController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingsSwiftUIController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            settingsSwiftUIController.view.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            settingsSwiftUIController.view.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            settingsSwiftUIController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        self.settingsSwiftUIController = settingsSwiftUIController
        
    }
    
    private func handleTap(option: RMSettingsOption) {
        guard Thread.current.isMainThread else {
            return
        }
        if let url = option.targetURL {
            //open website
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        } else if option == .rateApp {
            // show rating
            if let windowScene = view.window?.windowScene {
                SKStoreReviewController.requestReview(in: windowScene)
            }
        }
    }
    
}
