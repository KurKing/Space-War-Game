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
    private var spaceBackground: SKSpriteNode!
    
    private var score: Score!
    
    //MARK: Did Move
    override func didMove(to view: SKView) {
    
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -3)
        
        //Create BG
        spaceBackground = SKSpriteNode(imageNamed: ImageNames.backgroundImage)
        spaceBackground.size = CGSize(width: view.bounds.width+50, height: view.bounds.height+50)
        addChild(spaceBackground)
        
        // Create space ship
        addChild(spaceShip.SKNode)
        
        // Add meteors
        meteor = Meteor(frameSize: frame.size)
        meteor.run(in: self)
        
        // Score label
        score = Score(frameSize: frame.size)
        addChild(score.labelNode)
    }
    
    //MARK: Touches
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            spaceShip.move(to: touchLocation)
            
            let bgMoveAction = SKAction.move(to: CGPoint(x: -touchLocation.x/80, y: -touchLocation.y/80), duration: 0.1)
            spaceBackground.run(bgMoveAction)
        }
    }
    
    //MARK: Simulate Physics
    override func didSimulatePhysics() {
        //deleting meteors
        enumerateChildNodes(withName: "meteor") { (meteor, stop) in
            let heigth = UIScreen.main.bounds.height
            
            if meteor.position.y < -heigth/2-meteor.frame.height {
                meteor.removeFromParent()
                self.score.plusOne()
            }
        }
    }
    //MARK: SKPhysicsContactDelegate
    func didBegin(_ contact: SKPhysicsContact) {
        if isCollisionHappend(contact) {
            score.lose()
        }
    }
    
    private func isCollisionHappend(_ contact: SKPhysicsContact) -> Bool {
        return contact.bodyA.categoryBitMask == Categories.spaceShip || contact.bodyB.categoryBitMask == Categories.spaceShip
    }

}
