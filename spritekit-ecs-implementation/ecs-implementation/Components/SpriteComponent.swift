//
//  SpriteComponent.swift
//  ecs-implementation
//
//  Created by Pedro Franco on 22/10/23.
//

import SpriteKit
import GameplayKit

class SpriteComponent: GKComponent {
    var node: SKSpriteNode
    
    init(texture: SKTexture) {
        self.node = SKSpriteNode(texture: texture)
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
