//
//  LoginView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 11..
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

struct LoginView: View {
    @ObservedObject var presenter: LoginPresenter
    
    init(presenter: LoginPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image("placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipped()
                    .cornerRadius(150)
                    .padding(.bottom, 5)
                WelcomeText(text: "Welcome!")
                
                TextField("Email", text: $presenter.email)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 5)
                    .validation(presenter.emailValidation)
                SecureField("Password", text: $presenter.password)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 5)
                    .validation(presenter.emailValidation)
                Button(action:
                {
                    print("Login Button tapped")
                    self.presenter.login()
                }) {
                    LoginButtonContent()
                }
                .disabled(presenter.disableLogin)
                
                Spacer()
                self.presenter.linkBuilder(content: {
                    ButtonContent(text: "Register")
                        .padding(.bottom, 1)
                })
                
                Button(action:
                {
                    print("Forgot Password Button tapped")
                }) {
                    ButtonContent(text: "I forgot my password")
                }
            }
            .padding()
        }
    }
}

struct WelcomeText: View {
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
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
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(interactor: interactor)
        return NavigationView {
            LoginView(presenter: presenter)
        }
    }
}
