//
//  GameViewController.swift
//  ecs-implementation
//
//  Created by Pedro Franco on 22/10/23.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
      super.viewDidLoad()
      
      let aspectRatio = view.bounds.size.width / view.bounds.size.height
      
      let scene =
        GameScene(size:CGSize(width: 840 * aspectRatio, height: 840))
      let skView = self.view as! SKView
      skView.showsFPS = true
      skView.showsNodeCount = true
      skView.ignoresSiblingOrder = true
      scene.scaleMode = .aspectFill
      skView.presentScene(scene)
    }

}
