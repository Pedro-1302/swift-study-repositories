//
//  CustomButtonNode.swift
//  ecs-implementation
//
//  Created by Pedro Franco on 22/10/23.
//

import Foundation
import SpriteKit

class ButtonNode : SKSpriteNode {

  let onButtonPress: () -> ()
  
  init(text: String, onButtonPress: @escaping () -> ()) {
   
    self.onButtonPress = onButtonPress
   
    let texture = SKTexture(imageNamed: "button")
    super.init(texture: texture, color: SKColor.white, size: texture.size())
    
    let label = SKLabelNode(fontNamed: "Courier-Bold")
    label.fontSize = 26
    label.fontColor = SKColor.black
    label.zPosition = 1
    label.verticalAlignmentMode = .center
    label.text = text
    self.addChild(label)
    
    isUserInteractionEnabled = true
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    onButtonPress()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
