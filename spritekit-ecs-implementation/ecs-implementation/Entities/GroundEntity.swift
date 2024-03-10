//
//  GroundEntity.swift
//  ecs-implementation
//
//  Created by Pedro Franco on 22/10/23.
//

import SpriteKit
import GameplayKit

class GroundEntity: GKEntity {
    init(imageName: String, entityManager: EntityManager) {
        super.init()

        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        let physicsComponent = PhysicsComponent(node: spriteComponent.node, entityType: .ground)

        addComponent(spriteComponent)
        addComponent(physicsComponent)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
