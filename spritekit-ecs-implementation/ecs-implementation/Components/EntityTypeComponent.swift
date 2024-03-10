//
//  EntityTypeComponent.swift
//  ecs-implementation
//
//  Created by Pedro Franco on 22/10/23.
//

import SpriteKit
import GameplayKit

enum EntityType: Int {
    case hero = 1
    case ground = 2
    
    static let allValues = [hero, ground]
}

class EntityTypeComponent: GKComponent {
    let entityType: EntityType
    
    init(entityType: EntityType) {
        self.entityType = entityType
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
