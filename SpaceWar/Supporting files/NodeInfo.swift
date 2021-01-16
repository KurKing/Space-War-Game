//
//  NodeInfo.swift
//  SpaceWar
//
//  Created by Oleksiy on 16.01.2021.
//

import Foundation

struct NodeInfo {
    static let meteor = "meteor"
    static let spaceShip = "spaceShip"
    
    static let meteorCategory: UInt32 = 0x1 << 0
    static let spaceShipCategory: UInt32 = 0x1 << 1
}
