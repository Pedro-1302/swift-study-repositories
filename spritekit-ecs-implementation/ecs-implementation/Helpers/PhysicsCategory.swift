//
//  PhysicsCategory.swift
//  ecs-implementation
//
//  Created by Pedro Franco on 22/10/23.
//

import Foundation

struct PhysicsCategory {
    static let ground: UInt32 = 0x1 << 0
    static let hero: UInt32 = 0x1 << 1
}
