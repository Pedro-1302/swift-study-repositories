//
//  ViewController.swift
//  lifecycle
//
//  Created by Pedro Franco on 08/02/24.
//

import UIKit

// MARK: - To see all the methods running in the console, click on the segue indication in main.storyboard and change the "Presentation" field, which was "Same as Destination" to "Fullscreen".

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        self.isModalInPresentation = false
        print("VC1 viewDidLoad Called")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("VC1 viewWillAppear Called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("VC1 viewDidAppear Called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("VC1 viewWillDisappear Called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("VC1 viewDidDisappear Called")
    }
}

