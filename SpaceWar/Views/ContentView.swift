//
//  ContentView.swift
//  SpaceWar
//
//  Created by Oleksiy on 17.01.2021.
//

import SwiftUI
import SpriteKit
import GameplayKit

struct ContentView: View, ButtonPressedDelegate, GameSceneDelegate {
    
    //MARK: - Properties
    @State private var showMenu = true
    @State private var isGamePaused = false
    @State private var gameScore: Int = 0
    
    func playButtonPressed() {
        if !isGamePaused {
            gameScore = 0
            GameSceneContainer.shared.scene.deleteMeteors()
            GameSceneContainer.shared.scene.canSpaceShipMove = true
        }
        GameSceneContainer.shared.scene.isPaused = false
        isGamePaused = false
        showMenu = false
    }
    
    func addOneToScore() {
        if !showMenu{
            gameScore += 1
        }
    }
    
    func lose() {
        if UserDefaults.standard.integer(forKey: Keys.maxScoreKey) < gameScore {
            UserDefaults.standard.setValue(gameScore, forKey: Keys.maxScoreKey)
        }
        showMenu = true
        gameScore = 0
        isGamePaused = false
        GameSceneContainer.shared.scene.canSpaceShipMove = false
    }
    
    //MARK: - Body
    var body: some View {
        ZStack {
            
            SpriteView(scene: GameSceneContainer.shared.scene)
                .frame(maxWidth: 640, maxHeight: .infinity, alignment: .center)
                .blur(radius: showMenu ? 5 : 0)
                .overlay(
                    Button(action: {
                        showMenu = true
                        isGamePaused = true
                        GameSceneContainer.shared.scene.isPaused = true
                    }, label: {
                        Image("pause-button")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                    })
                    .padding(.trailing, 20)
                    .padding(.top, 20)
                    .shadow(color: Color.black.opacity(0.8), radius: 8, x: 3, y: 2)
                    .blur(radius: showMenu ? 5 : 0), alignment: .topTrailing
                )
                .overlay(
                    HStack {
                        Image("meteor")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                        Text("x \(gameScore)")
                            .foregroundColor(.white)
                            .font(.system(.title, design: .rounded))
                            .bold()
                    }
                    .padding(.leading, 20)
                    .padding(.top, 25)
                    .shadow(color: Color.black.opacity(0.8), radius: 8, x: 3, y: 2)
                    .blur(radius: showMenu ? 5 : 0), alignment: .topLeading
                )
                .ignoresSafeArea(.all)
            
            if showMenu {
                MenuView(delegate: self)
                    .shadow(color: Color.black.opacity(0.4), radius: 6, x: 3, y: 2)
            }
            
        }//:ZStack
        .background(
            Color.black.ignoresSafeArea(.all)
        )
        .onAppear(){
            GameSceneContainer.shared.scene.delegateView = self
        }
        
    }//:Body
}

//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
