//
//  EntityManager.swift
//  ecs-implementation
//
//  Created by Pedro Franco on 22/10/23.
//

import Foundation
import SpriteKit
import GameplayKit

class EntityManager {
    lazy var componentSystems: [GKComponentSystem] = {
        let appleHero = GKComponentSystem(componentClass: HeroEntity.self)
        
        return [appleHero]
    }()
    
    var entities = Set<GKEntity>()
    let scene: SKScene
    
    init(scene: SKScene) {
        self.scene = scene
    }
    
    func add(_ entity: GKEntity) {
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            scene.addChild(spriteNode)
        }
        
        for componentSystem in componentSystems {
            componentSystem.addComponent(foundIn: entity)
        }
    }
    
    func remove(_ entity: GKEntity) {
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node {
            spriteNode.removeFromParent()
        }
        
        entities.remove(entity)
    }
    
    func jump() {
         for entity in entities {
             if let jumpComponent = entity.component(ofType: JumpComponent.self) {
                 jumpComponent.jump()
             }
         }
    }
    
    func playSoundForEntities() {
      for entity in entities {
          if let soundComponent = entity.component(ofType: SoundComponent.self) {
              soundComponent.playSound()
          }
      }
  }
}
