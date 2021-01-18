//
//  GameSceneDelegate.swift
//  SpaceWar
//
//  Created by Oleksiy on 18.01.2021.
//

import Foundation

protocol GameSceneDelegate {
    /// calls when one meteor is gone, so should plus one to gameScore value
    func addOneToScore()
    /// calls when that collision between meteor and space ship happened
    func lose()
}
