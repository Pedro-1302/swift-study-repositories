//
//  PhysicsComponent.swift
//  ecs-implementation
//
//  Created by Pedro Franco on 22/10/23.
//

import SpriteKit
import GameplayKit

class PhysicsComponent: GKComponent {
    var node: SKSpriteNode
    var entityType: EntityType
    
    init(node: SKSpriteNode, entityType: EntityType) {
        self.node = node
        self.entityType = entityType
        super.init()
        
        updatePhysics()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updatePhysics() {
        let physicsBody = SKPhysicsBody(texture: node.texture!, size: node.size)
        node.physicsBody = physicsBody
        if entityType == .ground {
            physicsBody.isDynamic = false
        } else {
            physicsBody.isDynamic = true
        }
    }
}
