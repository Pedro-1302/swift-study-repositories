//
//  GameManager.swift
//  games-api
//
//  Created by Pedro Franco on 04/02/24.
//

import Foundation

protocol GameManagerDelegate {
    func didFailWithError(error: Error)
    func didReturnGame(_ gameManager: GameManager, game: GameModel)
}

struct GameManager {
    
    let baseURl = "https://api.rawg.io/api/games"
    let apiKey = "3c29e04b8d6d4f9f85a99b46897f152f"
    
    var delegate: GameManagerDelegate?
    
    func fetchGame(game: String) {
        
        let gameName = formatGameText(for: game)
        
        let urlString = "\(baseURl)/\(gameName)?key=\(apiKey)"
        
        performRequest(with: urlString)
    }
    
    func formatGameText(for gameText: String) -> String {
        let game = gameText
        let gameWithoutSpaces = game.replacingOccurrences(of: " ", with: "-")
        return gameWithoutSpaces
    }
    
    func performRequest(with urlString: String)  {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let game = self.parseJSON(gameData: safeData) {
                        delegate?.didReturnGame(self, game: game)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(gameData: Data) -> GameModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(GameData.self, from: gameData)
            
            let game = GameModel(name: decodedData.name, metacritic: decodedData.metacritic ?? 0, background_image: decodedData.background_image, released: decodedData.released)
            
            return game
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
