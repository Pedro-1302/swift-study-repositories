//
//  GameModel.swift
//  games-api
//
//  Created by Pedro Franco on 04/02/24.
//

import Foundation
import UIKit

struct GameModel {
    let name: String
    let metacritic: Int
    let background_image: String
    let released: String
    
    var stringMetacritic: String {
        return String(metacritic)
    }
    
    var backgroundImageData: Data?
    
    var viewColor: UIColor {
        switch (metacritic) {
            case 75...100:
                return .green
            case 50...74:
                return .yellow
            case 0...49:
                return .red
            default:
                return .red
        }
    }
    
    func loadImage(completion: @escaping (UIImage?) -> Void) {
        guard let imageUrl = URL(string: background_image) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, _, error in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let imageData = data, let image = UIImage(data: imageData) {
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
