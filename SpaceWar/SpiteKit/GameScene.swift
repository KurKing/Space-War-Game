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
        spaceBackground.size = CGSize(width: view.bounds.width, height: view.bounds.height)
        addChild(spaceBackground)
        
        // Space sheep node
        spaceShip = SKSpriteNode(imageNamed: ImageNames.redSpaceShip)

        spaceShip.size = CGSize(width: Config.spaceShipWidth, height: Config.spaceShipHeigth)
        
        spaceShip.physicsBody = SKPhysicsBody(texture: spaceShip.texture!, size: spaceShip.size)
        spaceShip.physicsBody?.isDynamic = false
        
        addChild(spaceShip)
        
        let meteorSequensAction = SKAction.sequence([
            SKAction.run {
                let meteor = self.createMeteor()
                self.addChild(meteor)
            },
            SKAction.wait(forDuration: 1.0/Config.meteorPerSecond, withRange: 0.5)
        ])
        
        let meteorRunAction = SKAction.repeatForever(meteorSequensAction)
        
        run(meteorRunAction)
    }
    
    //MARK: Touches
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            let touchLocation = touch.location(in: self)
            let duration = timeForMoveCalc(startPoint: spaceShip.position, finishPoint: touchLocation)
            
            let moveAction = SKAction.move(to: touchLocation, duration: duration)
            
            spaceShip.run(moveAction)
            
        }
    }
    
    //MARK: Meteor
    private func createMeteor() -> SKSpriteNode{
        let meteor = SKSpriteNode(imageNamed: ImageNames.meteor)
        let size = Int.random(in: Config.minMeteorSize...Config.maxMeteorSize)
        
        meteor.position.x = CGFloat.random(in: -frame.size.width/2...frame.size.width/2)
        meteor.position.y = frame.size.height/2 + meteor.size.height
        meteor.size = CGSize(width: size, height: size)
        
        meteor.physicsBody = SKPhysicsBody(texture: meteor.texture!, size: meteor.size)
        
        meteor.name = NodeNames.meteor
        
        return meteor
    }
    
    //MARK: Simulate Physics
    override func didSimulatePhysics() {
        
        //deleting meteors
        enumerateChildNodes(withName: NodeNames.meteor) { (meteor, stop) in
            let heigth = UIScreen.main.bounds.height
            
            if meteor.position.y < -heigth/2-meteor.frame.height {
                meteor.removeFromParent()
            }
        }
    }
    
    //MARK: Space ship logic
    private func timeForMoveCalc(startPoint: CGPoint, finishPoint: CGPoint) -> TimeInterval {
        return TimeInterval(sqrt((startPoint.x-finishPoint.x)*(startPoint.x-finishPoint.x)+(startPoint.y-finishPoint.y)*(startPoint.y-finishPoint.y))/CGFloat(Config.spaceShipSpeed))
    }
}
