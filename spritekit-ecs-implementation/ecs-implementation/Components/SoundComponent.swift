//
//  SoundComponent.swift
//  ecs-implementation
//
//  Created by Pedro Franco on 22/10/23.
//

import SpriteKit
import GameplayKit

class SoundComponent: GKComponent {
    var soundAction: SKAction?
    
    init(soundFileName: String) {
        super.init()
        loadSound(fileName: soundFileName)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadSound(fileName: String) {
        let sound = SKAction.playSoundFileNamed(fileName, waitForCompletion: false)
        soundAction = sound
    }
    
    func playSound() {
        if let soundAction = soundAction {
            entity?.component(ofType: SpriteComponent.self)?.node.run(soundAction)
        }
    }
}
