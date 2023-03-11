//
//  RMCharacterViewController.swift
//  Rick&Morty
//
//  Created by Петр Караиван on 10.03.2023.
//

import UIKit

/// Контроллер для отображения и поиска Characters
final class RMCharacterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(
            endpoint: .character,
            quaryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive")
            ]
        )
        print(request.url)
        
        RMService.shared.execute(request, expecting: RMCharacter.self) { result in
            
            }
        }
    }

