//
//  MenuView.swift
//  SpaceWar
//
//  Created by Oleksiy on 17.01.2021.
//

import SwiftUI

struct MenuView: View {
    
    @State private var buttonAnimating = false
    let delegate: ButtonPressedDelegate
    
    var body: some View {
        VStack {
            // Play button
            Button(action: {
                delegate.playButtonPressedDelegate()
            }, label: {
                Image("play-button")
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .center)
            })
            .shadow(color: Color.black.opacity(0.6), radius: 8, x: 3, y: 2)
            .scaleEffect(buttonAnimating ?  1 : 1.15)
            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
            .onAppear() {
                buttonAnimating.toggle()
            }
            
            
            Spacer()
                .frame(height: 30)
            
            HStack(alignment: .center, spacing: 30){
                
                //gear button
                Button(action: {
                    delegate.gearButtonPressedDelegate()
                }, label: {
                    Image("gear-button")
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .center)
                })
                .shadow(color: Color.black.opacity(0.8), radius: 8, x: 3, y: 2)
                
                //question button
                Button(action: {
                    delegate.questionButtonPressedDelegate()
                }, label: {
                    Image("question-button")
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .center)
                })
                .shadow(color: Color.black.opacity(0.8), radius: 8, x: 3, y: 2)
            }
        }//:VStack
        .padding(40)
        .background(
            Color("MenuBG-color")
        )
        .cornerRadius(20)
    }
}

//MARK: - Preview
//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//            .padding(5)
//            .previewLayout(.sizeThatFits)
//    }
//}

