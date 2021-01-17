//
//  GameSceneContainer.swift
//  SpaceWar
//
//  Created by Oleksiy on 17.01.2021.
//

import SpriteKit
import GameplayKit

class GameSceneContainer {
    static let shared = GameSceneContainer()
    
    private var gameScene: SKScene?
    
    var scene: SKScene {
        if let scene = gameScene {
            return scene
        } else {
            let scene = GameScene()
            scene.size = UIScreen.main.bounds.size
            scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            scene.scaleMode = .aspectFit
            gameScene = scene
            return scene
        }
    }
    
    private init(){}
}
