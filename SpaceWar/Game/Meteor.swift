//
//  Meteor.swift
//  SpaceWar
//
//  Created by Oleksiy on 17.01.2021.
//

import SpriteKit
import GameplayKit

/// helper struct for meteor node
struct Meteor {
    let frameSize: CGSize
    
    /// get new meteor node
    var node: SKSpriteNode {
        let meteor = SKSpriteNode(imageNamed: ImageNames.meteor)
        let size = Int.random(in: 20...90)
        
        
        
        //position
        meteor.position.x = CGFloat.random(in: -frameSize.width/2...frameSize.width/2)
        meteor.position.y = frameSize.height/2 + meteor.size.height

        meteor.size = CGSize(width: size, height: size)
        
        meteor.physicsBody = SKPhysicsBody(texture: meteor.texture!, size: meteor.size)
        
        //collision
        meteor.physicsBody?.categoryBitMask = Categories.meteor
        meteor.physicsBody?.collisionBitMask = Categories.spaceShip | Categories.meteor
        meteor.physicsBody?.contactTestBitMask = Categories.spaceShip
        
        meteor.physicsBody?.angularVelocity = CGFloat(Float.random(in: -5...5))
        meteor.physicsBody?.velocity.dx = CGFloat(Float.random(in: -100...100))
        
        meteor.name = "meteor"
        
        let colorAnimation = SKAction.colorize(with: [
            UIColor.red,
            UIColor.yellow,
            UIColor.green,
            UIColor.white
        ].randomElement()!, colorBlendFactor: 0.2, duration: 0)
        meteor.run(colorAnimation)
        
        return meteor
    }
    
    /// run SKActions for meteors
    func run(in parent: SKScene) {
        let meteorSequensAction = SKAction.sequence([
            SKAction.run {
                let meteor = self.node
                parent.addChild(meteor)
            },
            SKAction.wait(forDuration: 0.5, withRange: 0.5)
        ])
        
        parent.run(SKAction.repeatForever(meteorSequensAction))
    }
}
