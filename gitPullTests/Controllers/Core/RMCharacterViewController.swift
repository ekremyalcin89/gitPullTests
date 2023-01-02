//
//  RMCharacterViewController.swift
//  gitPullTests
//
//  Created by Ekrem on 28.12.2022.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(
            endpoint: .character,
            queryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive")
            ]
        )
        print(request.url)
        
        
        RMService.shared.execute(request, expecting: RMCharacter.self) { result in
            
        }
        
        
    }
        
      
}
    

  


