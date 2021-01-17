//
//  SettingsView.swift
//  SpaceWar
//
//  Created by Oleksiy on 17.01.2021.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 5){
            Text("Settings")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .shadow(color: Color.white.opacity(0.3), radius: 4, x: 3, y: 2)
                .padding(.vertical, 10)
            
            Form{
                Section() {
                    
                    HStack {
                        Text("Settings").foregroundColor(.gray)
                        Spacer()
                        Text("Value")
                    }//:HStack
                    
                    HStack {
                        Text("Settings").foregroundColor(.gray)
                        Spacer()
                        Text("Value")
                    }//:HStack
                    
                    HStack {
                        Text("Settings").foregroundColor(.gray)
                        Spacer()
                        Text("Value")
                    }//:HStack
                    
                    HStack {
                        Text("Settings").foregroundColor(.gray)
                        Spacer()
                        Text("Value")
                    }//:HStack
                    
                    HStack {
                        Text("Settings").foregroundColor(.gray)
                        Spacer()
                        Text("Value")
                    }//:HStack
                    
                }//:Section
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
