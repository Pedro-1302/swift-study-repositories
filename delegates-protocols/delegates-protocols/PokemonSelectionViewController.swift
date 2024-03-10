//
//  PokemonSelectionViewController.swift
//  delegates-protocols
//
//  Created by Pedro Franco on 29/01/24.
//

import UIKit

protocol PokemonSelectionDelegate {
    func didSelectProduct(imageName: String, pokemonName: String)
}

class PokemonSelectionViewController: UIViewController {
    @IBOutlet weak var charmanderButton: UIButton!
    @IBOutlet weak var bulbassaurButton: UIButton!
    @IBOutlet weak var squirtleButton: UIButton!
    
    var delegate: PokemonSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charmanderButton.addTarget(self, action: #selector(returnCharmander), for: .touchUpInside)
        bulbassaurButton.addTarget(self, action: #selector(returnBulbassaur), for: .touchUpInside)
        squirtleButton.addTarget(self, action: #selector(returnSquirtle), for: .touchUpInside)
    }
    
    @objc func returnCharmander() {
        delegate?.didSelectProduct(imageName: "d-charmander", pokemonName: "Charmander")
        dismissScreen()
    }
    
    @objc func returnBulbassaur() {
        delegate?.didSelectProduct(imageName: "d-bulbassaur", pokemonName: "Bulbassaur")
        dismissScreen()
    }
    
    @objc func returnSquirtle() {
        delegate?.didSelectProduct(imageName: "d-squirtle", pokemonName: "Squirtle")
        dismissScreen()
    }
    
    func dismissScreen() {
        dismiss(animated: true)
    }
}
