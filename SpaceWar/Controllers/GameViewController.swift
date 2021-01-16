//
//  GameViewController.swift
//  SpaceWar
//
//  Created by Oleksiy on 16.01.2021.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            if let scene = SKScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFit
                view.presentScene(scene)
            }
            
            view.showsNodeCount = true
            view.showsFPS = true
        }
        
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
