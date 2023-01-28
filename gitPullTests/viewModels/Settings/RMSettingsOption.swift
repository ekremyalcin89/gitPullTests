//
//  RMSettingsOption.swift
//  gitPullTests
//
//  Created by Ekrem on 26.01.2023.
//

import UIKit

enum RMSettingsOption: CaseIterable {
    case rateApp
    case contatcUs
    case terms
    case privacy
    case apiReferance
    case viewSeries
    case viewCode
    
    var targetURL: URL? {
        switch self {
        case .rateApp:
            return nil
        case .contatcUs:
            return URL(string: "https://github.com/ekremyalcin89")
        case .terms:
            return URL(string: "https://github.com/ekremyalcin89/gitPullTests")
        case .privacy:
            return URL(string: "https://github.com/ekremyalcin89/gitPullTests")
        case .apiReferance:
            return URL(string: "https://github.com/ekremyalcin89/gitPullTests")
        case .viewSeries:
            return URL(string: "https://www.youtube.com/watch?v=1uYXeBRBBKc")
        case .viewCode:
            return URL(string: "https://github.com/ekremyalcin89/gitPullTests")
        }
    }
    
    var displayTitle: String {
        switch self {
        case .rateApp:
            return "Rate App"
        case .contatcUs:
            return "Contact Us"
        case .terms:
            return "Terms Of Service"
        case .privacy:
            return "Privacy Policy"
        case .apiReferance:
            return "API Reference"
        case .viewSeries:
            return "View Video Series"
        case .viewCode:
            return "View App Code"
        }
    }
    
    var iconContainerColor: UIColor {
        switch self {
        case .rateApp:
            return .systemRed
        case .contatcUs:
            return .systemBlue
        case .terms:
            return .systemOrange
        case .privacy:
            return .systemPink
        case .apiReferance:
            return .systemGray
        case .viewSeries:
            return .systemGreen
        case .viewCode:
            return .systemYellow
        }
    }
    
    var iconImage: UIImage? {
        switch self {
        case .rateApp:
            return UIImage(systemName: "star.leadinghalf.filled")
        case .contatcUs:
            return UIImage(systemName: "paperplane.fill")
        case .terms:
            return UIImage(systemName: "doc.on.doc.fill")
        case .privacy:
            return UIImage(systemName: "lock.fill")
        case .apiReferance:
            return UIImage(systemName: "list.bullet.rectangle.fill")
        case .viewSeries:
            return UIImage(systemName: "play.tv.fill")
        case .viewCode:
            return UIImage(systemName: "barcode")
        }
    }
}
