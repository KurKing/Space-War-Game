//
//  Score.swift
//  SpaceWar
//
//  Created by Oleksiy on 17.01.2021.
//

import SpriteKit
import GameplayKit

/// helper struct for SKLabelNode
struct Score {
    private var score = 0
    let scoreLabel = SKLabelNode(text: "Score 0")
    
    init(frameSize: CGSize) {
        scoreLabel.position = CGPoint(x: -frameSize.width/2+70, y: frameSize.height/2-scoreLabel.calculateAccumulatedFrame().height-10)
    }
    
    var labelNode: SKLabelNode {
        return scoreLabel
    }
    
    mutating func plusOne(){
        score += 1
        scoreLabel.updateLabel(with: score)
    }
    
    mutating func lose(){
        score = 0
        scoreLabel.updateLabel(with: score)
    }
}

extension SKLabelNode {
    func updateLabel(with score: Int) {
        self.text = "Score \(score)"
    }
}
