//
//  ViewController.swift
//  gitPullTests
//
//  Created by Ekrem on 26.12.2022.
//

import UIKit

final class RMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUpTabs()
    }

    private func setUpTabs() {
        let charactersVc = RMTabBarController()
        let locationsVc = RMLocationViewController()
        let episodesVc = RMEpisodeViewController()
        let settingsVc = RMSettingsViewController()
        
        charactersVc.title = "characters"
        locationsVc.title = "locations"
        episodesVc.title = "episodes"
        settingsVc.title = "settings"

        let nav1 = UINavigationController(rootViewController: charactersVc)
        let nav2 = UINavigationController(rootViewController: locationsVc)
        let nav3 = UINavigationController(rootViewController: episodesVc)
        let nav4 = UINavigationController(rootViewController: settingsVc)
        
        setViewControllers(
           [nav1, nav2, nav3, nav4],
              animated: true
        )
       
    }

    
    
}

