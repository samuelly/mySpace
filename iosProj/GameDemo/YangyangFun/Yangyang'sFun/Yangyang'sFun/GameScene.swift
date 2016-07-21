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
            var pics = ["yangyang_1.png","yangyang_2.png","yangyang_3.png"]
            let randomNumber:Int = Int(arc4random_uniform(UInt32(pics.count)))
            let img:String = pics[randomNumber]
            NSLog("num is %d, img is %s", randomNumber,img)
            let sprite = SKSpriteNode(imageNamed:img)
            
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
