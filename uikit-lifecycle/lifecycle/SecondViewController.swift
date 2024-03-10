//
//  SecondViewController.swift
//  lifecycle
//
//  Created by Pedro Franco on 08/02/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Hello"
        
        print("VC2 viewDidLoad Called")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("VC2 viewWillAppear Called")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("VC2 viewDidAppear Called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("VC2 viewWillDisappear Called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("VC2 viewDidDisappear Called")
    }
    
}
