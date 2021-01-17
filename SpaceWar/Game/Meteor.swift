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
        let size = Int.random(in: Config.minMeteorSize...Config.maxMeteorSize)
        
        //position
        meteor.position.x = CGFloat.random(in: -frameSize.width/2...frameSize.width/2)
        meteor.position.y = frameSize.height/2 + meteor.size.height

        meteor.size = CGSize(width: size, height: size)
        
        meteor.physicsBody = SKPhysicsBody(texture: meteor.texture!, size: meteor.size)
        
        //collision
        meteor.physicsBody?.categoryBitMask = NodeInfo.spaceShipCategory
        meteor.physicsBody?.collisionBitMask = NodeInfo.spaceShipCategory
        meteor.physicsBody?.contactTestBitMask = NodeInfo.spaceShipCategory
        
        meteor.name = NodeInfo.meteor
        
        return meteor
    }
    
    /// run SKActions for meteors
    func run(in parent: SKScene) {
        let meteorSequensAction = SKAction.sequence([
            SKAction.run {
                let meteor = self.node
                parent.addChild(meteor)
            },
            SKAction.wait(forDuration: 1.0/Config.meteorPerSecond, withRange: 0.5)
        ])
        
        parent.run(SKAction.repeatForever(meteorSequensAction))
    }
}
