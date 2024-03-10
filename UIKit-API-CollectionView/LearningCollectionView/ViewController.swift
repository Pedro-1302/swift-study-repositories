//
//  ViewController.swift
//  LearningCollectionView
//
//  Created by Pedro Franco on 28/05/23.
//

import UIKit

var films: [Movie] = []

public var change = true

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var catalogTittle: UILabel!
    
    @IBOutlet weak var segmentedControll: UISegmentedControl!

    @IBAction func segmentedControllAction(_ sender: UISegmentedControl) {
        switch segmentedControll.selectedSegmentIndex{
            case 0:
                change = true
            case 1:
                change = false
            default:
                print("Errouuu!")
        }
        self.loadData();
    }
    
    func loadData() {
        collectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControll.setTitle("Filmes", forSegmentAt: 0)
        segmentedControll.setTitle("Series", forSegmentAt: 1)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        fetchAndPrintPopularMovies()
    }
    
    func fetchAndPrintPopularMovies() {
        let apiManager = TMDBAPIManager()

        apiManager.fetchPopularMovies { (movies, error) in
            if let error = error {
                print("Erro ao obter filmes populares: \(error)")
                return
            }
            
            if let movies = movies {
                films = movies // Atribuir os filmes à matriz `films` da sua ViewController
                DispatchQueue.main.async {
                    self.collectionView.reloadData() // Atualizar a collectionView após receber os dados
                }
            }
        }
    }


    /*
    func fetchAndPrintPopularMovies() {
        let apiManager = TMDBAPIManager()

        apiManager.fetchPopularMovies { (movies, error) in
            if let error = error {
                print("Erro ao obter filmes populares: \(error)")
                return
            }
            
            if let movies = movies {
                for movie in movies {
                    print("Print:: Título: \(movie.title)")
                    print("Print:: Visão geral: \(movie.overview)")
                    print("Print:: Data de lançamento: \(movie.releaseDate)")
                    print("Print:: Imagem pequena: \(movie.poster_path)")
                    print("Print:: Imagem grande: \(movie.backdrop_path)")
                    print("Print:: =====================")
                    
                }
            }
        }
    }
     */
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return films.count - 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatalogCollectionViewCell", for: indexPath) as! CatalogCollectionViewCell
        
        if change {
            cell.setupFilm(with: films[indexPath.row])
            catalogTittle.text = "Filmes"
        } else {
            cell.setupSeries(with: series[indexPath.row])
            catalogTittle.text = "Series"
        }
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 108, height: 152)
    }
}

