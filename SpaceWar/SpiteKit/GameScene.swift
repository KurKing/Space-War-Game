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
        spaceShip = SKSpriteNode(imageNamed: Names.redSpaceShip)
        
        spaceShip.size = CGSize(width: 101, height: 175)
        
        addChild(spaceShip)
    }
    
    //MARK: Touches
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            let touchLocation = touch.location(in: self)
            
            let moveAction = SKAction.move(to: touchLocation, duration: 0.1)
            
            spaceShip.run(moveAction)
            
        }
    }
    
    //MARK: SpaceShip size
    private func getSpaceShipSize(width: Int) -> CGSize {
        let height = Int(width / 101 * 175)
        return CGSize(width: width, height: height)
    }
}
