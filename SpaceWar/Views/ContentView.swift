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
    
    func playButtonPressedDelegate() {
        showMenu = false
    }
    
    func gearButtonPressedDelegate() {
        
    }
    
    func questionButtonPressedDelegate() {
        
    }
    
    //MARK: - Body
    var body: some View {
        ZStack {
            
            EmptyView()
                .blur(radius: showMenu ? 5 : 0)
            
            if showMenu {
                MenuView(delegate: self)
                    .shadow(color: Color.black.opacity(0.4), radius: 6, x: 3, y: 2)
            }
            
        }//:ZStack
        
    }//:Body
}

//MARK: - Settings
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
