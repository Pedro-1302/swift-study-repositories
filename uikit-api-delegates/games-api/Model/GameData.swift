//
//  GameData.swift
//  games-api
//
//  Created by Pedro Franco on 04/02/24.
//

import Foundation

struct GameData: Codable {
    let name: String
    let metacritic: Int?
    let background_image: String
    let released: String
}
