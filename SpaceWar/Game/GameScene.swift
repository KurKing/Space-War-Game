//
//  GameScene.swift
//  SpaceWar
//
//  Created by Oleksiy on 16.01.2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private let spaceShip = SpaceShip()
    private var meteor: Meteor!
    
    //MARK: Did Move
    override func didMove(to view: SKView) {
    
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -3)
        
        //Create BG
        let spaceBackground = SKSpriteNode(imageNamed: ImageNames.backgroundImage)
        spaceBackground.size = CGSize(width: view.bounds.width, height: view.bounds.height)
        addChild(spaceBackground)
        
        // Create space ship
        addChild(spaceShip.SKNode)
        
        //Add meteors
        meteor = Meteor(frameSize: frame.size)
        meteor.run(in: self)
    }
    
    //MARK: Touches
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            spaceShip.move(to: touchLocation)
        }
    }
    
    //MARK: Simulate Physics
    override func didSimulatePhysics() {
        //deleting meteors
        enumerateChildNodes(withName: NodeInfo.meteor) { (meteor, stop) in
            let heigth = UIScreen.main.bounds.height
            
            if meteor.position.y < -heigth/2-meteor.frame.height {
                meteor.removeFromParent()
            }
        }
    }
    //MARK: - SKPhysicsContactDelegate
    func didBegin(_ contact: SKPhysicsContact) {
        print("\(contact.bodyA.node?.name) vs. \(contact.bodyB.node?.name)")
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        
    }
}
