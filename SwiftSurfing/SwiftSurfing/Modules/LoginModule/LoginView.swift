//
//  LoginView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 11..
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var presenter: LoginPresenter
    
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
            
            TextField("Email", text: $presenter.email)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 5)
            SecureField("Password", text: $presenter.password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 5)
            Button(action:
            {
                print("Button tapped")
                presenter.login()
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

struct WelcomeText: View {
    var body: some View {
        Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 10)
    }
}

struct LoginButtonContent: View {
    var body: some View {
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 220, height: 50)
            .background(Color.blue)
            .cornerRadius(15.0)
    }
}

struct ButtonContent: View {
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 220, height: 40)
            .background(Color.blue)
            .cornerRadius(15.0)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
