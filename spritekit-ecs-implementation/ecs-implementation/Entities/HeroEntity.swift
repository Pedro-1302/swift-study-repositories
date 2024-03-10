//
//  HeroEntity.swift
//  ecs-implementation
//
//  Created by Pedro Franco on 22/10/23.
//

import SpriteKit
import GameplayKit

class HeroEntity: GKEntity {
    init(imageName: String, entityManager: EntityManager) {
        super.init()

        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        let physicsComponent = PhysicsComponent(node: spriteComponent.node, entityType: .hero)
        let jumpComponent = JumpComponent()
        let soundComponent = SoundComponent(soundFileName: "lionlaugh4.wav")

        addComponent(spriteComponent)
        addComponent(physicsComponent)
        addComponent(jumpComponent)
        addComponent(soundComponent)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
