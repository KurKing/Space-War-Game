//
//  SpaceShip.swift
//  SpaceWar
//
//  Created by Oleksiy on 17.01.2021.
//

import SpriteKit
import GameplayKit

/// hepler struct for SpaceShip;
/// contain the actual SKSpriteNode and some additional features for the spaceship
struct SpaceShip {
    
    private let spaceShipWidth = 50
    private let spaceShipHeigth: Int = 50*175/101
    
    private let node = SKSpriteNode(imageNamed: ImageNames.spaceShip)
    
    init() {
        // add some configs to SKSpriteNode:
        node.size = CGSize(width: spaceShipWidth, height: spaceShipHeigth)
        
        // physicsBody
        node.physicsBody = SKPhysicsBody(texture: node.texture!, size: node.size)
        node.physicsBody?.isDynamic = false
        
        //collision
        node.physicsBody?.categoryBitMask = Categories.spaceShip
        node.physicsBody?.collisionBitMask = Categories.meteor
        node.physicsBody?.contactTestBitMask = Categories.meteor
        
        node.name = "spaceShip"
    }
    
    /// move space ship to new location
    func move(to target: CGPoint){
        let duration = timeForMoveCalculate(startPoint: position, finishPoint: target)
        let moveAction = SKAction.move(to: target, duration: duration)
        
        node.run(moveAction)
    }
    
    /// calculate time for move from startPoint to finishPoint
    private func timeForMoveCalculate(startPoint: CGPoint, finishPoint: CGPoint) -> TimeInterval {
        return TimeInterval(sqrt((startPoint.x-finishPoint.x)*(startPoint.x-finishPoint.x)+(startPoint.y-finishPoint.y)*(startPoint.y-finishPoint.y))/800.0)
    }
    
    /// get reference to SKSpriteNode of space ship
    var SKNode: SKSpriteNode {
        return node
    }
    
    /// get actual position of space ship
    var position: CGPoint {
        return node.position
    }
}
