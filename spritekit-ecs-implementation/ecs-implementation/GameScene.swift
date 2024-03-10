//
//  GameScene.swift
//  ecs-implementation
//
//  Created by Pedro Franco on 22/10/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entityManager: EntityManager!
    var background: SKSpriteNode!
    var soundButton: ButtonNode!
    var jumpButton: ButtonNode!
    
    override func sceneDidLoad() {
        entityManager = EntityManager(scene: self)

        background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        background.zPosition = -2
        addChild(background)
        
        soundButton = ButtonNode(text: "Sound", onButtonPress: soundButtonAction)
        soundButton.position = CGPoint(x: size.width * 0.25, y: soundButton.size.height * 3.6)
        addChild(soundButton)
        
        jumpButton = ButtonNode(text: "Jump", onButtonPress: jumpButtonAction)
        jumpButton.position = CGPoint(x: size.width * 0.75, y: jumpButton.size.height * 3.6)
        addChild(jumpButton)
        
        let hero = HeroEntity(imageName: "hero", entityManager: entityManager)

        if let heroComponent = hero.component(ofType: SpriteComponent.self) {
            heroComponent.node.position = CGPoint(x: size.width * 0.5, y: size.height)
        }

       entityManager.add(hero)

       let ground = GroundEntity(imageName: "ground", entityManager: entityManager)

       if let groundSpriteComponent = ground.component(ofType: SpriteComponent.self) {
           let groundYPosition = groundSpriteComponent.node.size.height * 0.5

           groundSpriteComponent.node.position = CGPoint(x: size.width * 0.5, y: groundYPosition)
           groundSpriteComponent.node.zPosition = -1
       }

       entityManager.add(ground)

    }
    
    func soundButtonAction() {
        entityManager.playSoundForEntities()
    }
    
    func jumpButtonAction() {
        entityManager.jump()
    }
}
