//
//  JumpComponent.swift
//  ecs-implementation
//
//  Created by Pedro Franco on 22/10/23.
//

import SpriteKit
import GameplayKit

class JumpComponent: GKComponent {
    var altitude: CGFloat = 100
    var isJumping: Bool = false

    func jump() {
        if !isJumping {
            isJumping = true
            
            if let spriteComponent = entity?.component(ofType: SpriteComponent.self),
               let physicsBody = spriteComponent.node.physicsBody {
                
                let jumpAction = SKAction.sequence([
                    SKAction.moveBy(x: 0, y: altitude, duration: 0.5),
                    SKAction.moveBy(x: 0, y: -altitude, duration: 0.5)
                ])
                
                spriteComponent.node.run(jumpAction, completion: {
                    self.isJumping = false
                })
                
                physicsBody.applyImpulse(CGVector(dx: 0, dy: altitude))
            }
        }
    }
}
