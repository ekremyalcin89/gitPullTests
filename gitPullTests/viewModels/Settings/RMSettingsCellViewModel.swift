//
//  RMSettingsCellViewModel.swift
//  gitPullTests
//
//  Created by Ekrem on 26.01.2023.
//

import UIKit

struct RMSettingsCellViewModel: Identifiable, Hashable {
    let id = UUID()
    
    
private let type: RMSettingsOption
    
    
 init(type: RMSettingsOption) {
        self.type = type
      }

    public var image: UIImage? {
        return type.iconImage
    }
    
    
    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
    
}
