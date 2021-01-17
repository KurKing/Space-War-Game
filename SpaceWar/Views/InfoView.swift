//
//  InfoView.swift
//  SpaceWar
//
//  Created by Oleksiy on 17.01.2021.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 5){
            Text("Space War")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .shadow(color: Color.white.opacity(0.3), radius: 4, x: 3, y: 2)
                .padding(.vertical, 10)
            
            Form{
                
                //MARK: Section #1
                Section(header: Text("About")) {
                    
                    HStack {
                        Text("Product").foregroundColor(.gray)
                        Spacer()
                        Text("Space War Game")
                    }//:HStack
                    
                    HStack {
                        Text("Compatibility").foregroundColor(.gray)
                        Spacer()
                        Text("iPhone")
                    }//:HStack
                    
                    HStack {
                        Text("IOS").foregroundColor(.gray)
                        Spacer()
                        Text("14.3+")
                    }//:HStack
                    
                    HStack {
                        Text("Developer").foregroundColor(.gray)
                        Spacer()
                        Text("Oleksii Kurkin")
                    }//:HStack
                    
                    HStack {
                        Text("Version").foregroundColor(.gray)
                        Spacer()
                        Text("1.0.0")
                    }//:HStack
                    
                }//:Section #1
                
                //MARK: Section #2
                Section(header: Text("Contacts")) {
                    
                    HStack {
                        Text("Gmail").foregroundColor(.gray)
                        Spacer()
                        Text("lyosha.kurkin@gmail.com")
                    }//:HStack
                    
                    HStack {
                        Text("GitHub nick").foregroundColor(.gray)
                        Spacer()
                        Text("KurKing")
                    }//:HStack
                    
                }//:Section #2
                
                //MARK: Section #3
                Section(header: Text("Source Code")) {
                    
                    HStack {
                        Text("GitHub").foregroundColor(.gray)
                        Spacer()
                        Link("KurKing/Space-War-Game", destination: URL(string: "https://github.com/KurKing/Space-War-Game")!)
                    }//:HStack
                    
                }//:Section #3
                
            }//:Form
            
        }//:VStack
        .overlay(
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image("x-button")
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)
            }
            .shadow(color: Color.black.opacity(0.3), radius: 8, x: 3, y: 2)
            .padding(.top, 15)
            .padding(.trailing, 20)
            , alignment: .topTrailing
        )
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
