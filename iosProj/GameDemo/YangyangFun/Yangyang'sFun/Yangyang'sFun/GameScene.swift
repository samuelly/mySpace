//
//  GameScene.swift
//  Yangyang'sFun
//
//  Created by zhuqi on 16/7/19.
//  Copyright (c) 2016年 zhuqi. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "洋洋好～"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            var sprite = SKSpriteNode(imageNamed:"yangyang_1.jpg")
            var pics = ["yangyang_1.jpg","yangyang_2.jpg","yangyang_3.jpg"]
            let num = arc4random()%3
            NSLog("num is %d",num)
            if num == 0 {
                sprite = SKSpriteNode(imageNamed:pics[0])
            } else if num == 1 {
                sprite = SKSpriteNode(imageNamed:pics[1])
            } else if num == 2 {
                sprite = SKSpriteNode(imageNamed:pics[2])
            }
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            let time:Int = 3
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
