//
//  ContentView.swift
//  SpaceWar
//
//  Created by Oleksiy on 17.01.2021.
//

import SwiftUI

struct ContentView: View, ButtonPressedDelegate {
    
    //MARK: - Properties
    @State var showMenu = true
    
    func playButtonPressedDelegate() {
        print("playButtonPressedDelegate")
    }
    
    func gearButtonPressedDelegate() {
        print("gearButtonPressedDelegate")
    }
    
    func questionButtonPressedDelegate() {
        print("questionButtonPressedDelegate")
    }
    
    //MARK: - Body
    var body: some View {
        ZStack {
            Text("Scene")
            MenuView(delegate: self)
                .shadow(color: Color.black.opacity(0.4), radius: 6, x: 3, y: 2)
        }//:ZStack
        .frame(width: 600, height: 600, alignment: .center)
        .background(Color.white)
        
    }//:Body
}

//MARK: - Settings
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
