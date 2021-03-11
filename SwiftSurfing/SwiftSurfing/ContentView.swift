//
//  ContentView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 02. 24..
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Image("placeholder")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom, 5)
            
            WelcomeText()
            
            TextField("Email", text: $email)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 5)
            SecureField("Password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 5)
            Button(action:
            {
                print("Button tapped")
            }) {
                LoginButtonContent()
            }
            
            Spacer()
            Button(action:
            {
                print("Button tapped")
            }) {
                ButtonContent(text: "Register")
            }
            .padding(.bottom, 1)
            
            Button(action:
            {
                print("Button tapped")
            }) {
                ButtonContent(text: "I forgot my password")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
