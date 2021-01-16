//
//  GameScene.swift
//  SpaceWar
//
//  Created by Oleksiy on 16.01.2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //MARK: Nodes
    private var spaceShip: SKSpriteNode!
    
    //MARK: Did Move
    override func didMove(to view: SKView) {
        
        // BG node
        let spaceBackground = SKSpriteNode(imageNamed: ImageNames.backgroundImage)
        spaceBackground.size = CGSize(width: view.bounds.width*2, height: view.bounds.height*2)
        addChild(spaceBackground)
        
        // Space sheep node
        spaceShip = SKSpriteNode(imageNamed: ImageNames.redSpaceShip)
        spaceShip.size = CGSize(width: 101, height: 175)
        spaceShip.physicsBody = SKPhysicsBody(texture: spaceShip.texture!, size: spaceShip.size)
        spaceShip.physicsBody?.isDynamic = false
        
        addChild(spaceShip)
        
        let meteorSequensAction = SKAction.sequence([
            SKAction.run {
                let meteor = self.createMeteor()
                self.addChild(meteor)
            },
            SKAction.wait(forDuration: 0.7, withRange: 0.5)
        ])
        
        let meteorRunAction = SKAction.repeatForever(meteorSequensAction)
        
        run(meteorRunAction)
    }
    
    //MARK: Touches
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            let touchLocation = touch.location(in: self)
            
            let moveAction = SKAction.move(to: touchLocation, duration: 0.1)
            
            spaceShip.run(moveAction)
            
        }
    }
    
    //MARK: Meteor
    private func createMeteor() -> SKSpriteNode{
        let meteor = SKSpriteNode(imageNamed: ImageNames.meteor)
        let size = Int.random(in: 40...150)
        
        meteor.position.x = CGFloat.random(in: -frame.size.width/2...frame.size.width/2)
        meteor.position.y = frame.size.height/2 + meteor.size.height
        meteor.size = CGSize(width: size, height: size)
        
        meteor.physicsBody = SKPhysicsBody(texture: meteor.texture!, size: meteor.size)
        
        return meteor
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        //        let meteor = createMeteor()
        //        addChild(meteor)
        
    }
}
