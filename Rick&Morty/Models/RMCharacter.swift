//
//  RMCharacter.swift
//  Rick&Morty
//
//  Created by Петр Караиван on 10.03.2023.
//

import Foundation

struct RMCharacters: Codable {
   let id: Int
   let name: String
   let status: RMCharacterStatus
   let species: String
   let type: String
   let gender: RMCharacterGender
   let origin: RMOrigin
    let location: RMSingleLocation
    let image: String
   let episode: [String]
    let url: String
    let created: String
}


