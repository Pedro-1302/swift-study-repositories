//
//  GameScene.swift
//  spritekit-walk-run-actions
//
//  Created by Pedro Franco on 17/01/24.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var sprite = SKSpriteNode()
    var buttonTop = SKSpriteNode()
    var buttonBottom = SKSpriteNode()
    var runAction = SKAction(named: "Run")
    var value = 0.0
    var moveUpAction: SKAction!
    var moveDownAction: SKAction!
    var isMovingUp = false
    var isMovingDown = false

    override func sceneDidLoad() {
        self.physicsWorld.contactDelegate = self
        
        sprite = SKSpriteNode(imageNamed: "char-stop-1")
        sprite.position = CGPoint(x: 0, y: 0)
        sprite.size = CGSize(width: 160, height: 320)
        sprite.run(runAction!)
        addChild(sprite)
        
        buttonTop = SKSpriteNode(imageNamed: "button-top")
        buttonTop.position = CGPoint(x: -200, y: -300)
        addChild(buttonTop)
        
        buttonBottom = SKSpriteNode(imageNamed: "button-bottom")
        buttonBottom.position = CGPoint(x: -200, y: -500)
        addChild(buttonBottom)
        
        let moveUp = SKAction.moveBy(x: 0, y: 1, duration: 0.1)
        let moveDown = SKAction.moveBy(x: 0, y: -1, duration: 0.1)
        moveUpAction = SKAction.repeatForever(moveUp)
        moveDownAction = SKAction.repeatForever(moveDown)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if buttonTop.frame.contains(location) && sprite.position.y < 500 {
                isMovingUp = true
                sprite.run(moveUpAction, withKey: "moveUp")
            }
            
            if buttonBottom.frame.contains(location) && sprite.position.y > -500 {
                isMovingDown = true
                sprite.run(moveDownAction, withKey: "moveDown")
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {
            isMovingUp = false
            sprite.removeAction(forKey: "moveUp")
            
            isMovingDown = false
            sprite.removeAction(forKey: "moveDown")
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if sprite.position.y > 500 {
            isMovingUp = false
            sprite.removeAction(forKey: "moveUp")
        }
        
        if sprite.position.y < -500 {
            isMovingDown = false
            sprite.removeAction(forKey: "moveDown")
        }
            
        if isMovingUp && sprite.position.y < 500 {
            value += 50.0
            sprite.position = CGPoint(x: sprite.position.x, y: value)
        }
        
        if isMovingDown && sprite.position.y > -500 {
            value -= 50.0
            sprite.position = CGPoint(x: sprite.position.x, y: value)
        }
    }
}
