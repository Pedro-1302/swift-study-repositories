//
//  CatalogCollectionViewCell.swift
//  LearningCollectionView
//
//  Created by Pedro Franco on 28/05/23.
//

import UIKit

class CatalogCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var catalogImageView: UIImageView!
    
    public func setupFilm(with movie: Movie) {
        if let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)") {
            URLSession.shared.dataTask(with: imageURL) { [weak self] (data, response, error) in
                if let error = error {
                    print("Erro ao carregar a imagem: \(error)")
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.catalogImageView.image = image
                    }
                }
            }.resume()
        } else {
            print("URL da imagem inválida: \(movie.poster_path)")
        }
    }
    
    public func setupSeries(with movie: Series) {
        catalogImageView.image = movie.image
    }
}

