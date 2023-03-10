//
//  RMEndpoint.swift
//  Rick&Morty
//
//  Created by Петр Караиван on 10.03.2023.
//

import Foundation

/// Представляет уникальные конечные точки API
@frozen enum  RMEndpoint: String {
    /// Конечные точки для получения информации о персонаже
    case character // "character"
    /// Конечные точки для получения информации о локации
    case location
    /// Конечные точки для получения информации об эпизоде
    case episode
}
