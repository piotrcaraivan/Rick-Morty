//
//  RMCharacterStatus.swift
//  Rick&Morty
//
//  Created by Петр Караиван on 11.03.2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
