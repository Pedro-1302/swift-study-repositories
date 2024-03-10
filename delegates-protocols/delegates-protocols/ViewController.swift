//
//  ViewController.swift
//  delegates-protocols
//
//  Created by Pedro Franco on 29/01/24.
//

import UIKit

class ViewController: UIViewController, PokemonSelectionDelegate {
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var choosePokemonButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        choosePokemonButton.addTarget(self, action: #selector(presentPokemonSelectionVC), for: .touchUpInside)
    }

    @objc func presentPokemonSelectionVC() {
        performSegue(withIdentifier: "goToPokemonSelection", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPokemonSelection" {
            let destinationVC = segue.destination as! PokemonSelectionViewController
            destinationVC.delegate = self 
        }
    }
    
    // Protocol method
    func didSelectProduct(imageName: String, pokemonName: String) {
        pokemonImageView.image = UIImage(named: imageName)
        pokemonNameLabel.text = pokemonName
    }
}

