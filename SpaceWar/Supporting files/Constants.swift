//
//  Constants.swift
//  SpaceWar
//
//  Created by Oleksiy on 17.01.2021.
//

import Foundation

struct Categories {
    static let meteor: UInt32 = 0x1 << 0
    static let spaceShip: UInt32 = 0x1 << 1
}

struct ImageNames {
    static let spaceShip = "redSpaceShip"
    static let meteor = "meteor"
    static let backgroundImage = "bg"
}

struct Keys {
    static let scoreKey = "scoreKey"
    static let maxScoreKey = "maxScoreKey"
}
