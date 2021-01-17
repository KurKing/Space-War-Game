//
//  ContentView.swift
//  SpaceWar
//
//  Created by Oleksiy on 17.01.2021.
//

import SwiftUI
import SpriteKit
import GameplayKit

struct ContentView: View, ButtonPressedDelegate {
    
    //MARK: - Properties
    @State var showMenu = true
    @State var isGamePaused = false
    
    func playButtonPressedDelegate() {
        showMenu = false
        GameSceneContainer.shared.scene.isPaused = false
    }
    
    func gearButtonPressedDelegate() {
        
    }
    
    func questionButtonPressedDelegate() {
        
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
                    .padding(.top, 10)
                    .shadow(color: Color.black.opacity(0.8), radius: 8, x: 3, y: 2)
                    .blur(radius: showMenu ? 5 : 0), alignment: .topTrailing
                )
            
            if showMenu {
                MenuView(delegate: self)
                    .shadow(color: Color.black.opacity(0.4), radius: 6, x: 3, y: 2)
            }
            
        }//:ZStack
        .background(
            Color.black.ignoresSafeArea(.all)
        )
        
    }//:Body
}

//MARK: - Settings
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
