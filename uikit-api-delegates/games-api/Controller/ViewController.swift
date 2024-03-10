//
//  ViewController.swift
//  games-api
//
//  Created by Pedro Franco on 04/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var releasedDateLabel: UILabel!
    @IBOutlet weak var metacriticView: UIView!
    @IBOutlet weak var metacriticScoreLabel: UILabel!
    
    var gameManager = GameManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchTextField.delegate = self
        gameManager.delegate = self
        metacriticView.backgroundColor = .green
    }
}

extension ViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        gameManager.fetchGame(game: text)
    }
    
}

extension ViewController: GameManagerDelegate {
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func didReturnGame(_ gameManager: GameManager, game: GameModel) {
        DispatchQueue.main.async {
            game.loadImage { image in
                DispatchQueue.main.async {
                    self.gameImageView.image = image ?? UIImage(named: "default-img")
                }
            }
            
            self.gameNameLabel.text = game.name
            self.releasedDateLabel.text = "Released: \(game.released)"
            self.metacriticScoreLabel.text = game.stringMetacritic
            self.metacriticView.backgroundColor = game.viewColor
        }
    }
    
}
