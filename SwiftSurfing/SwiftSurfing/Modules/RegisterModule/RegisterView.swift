//
//  RegisterView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 03. 11..
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var presenter: RegisterPresenter
    
    init(presenter: RegisterPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Image("placeholder")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(150)
            
            Text("Create a new account to SwiftSurfing!")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom, 1)
            
            TextField("First Name", text: $presenter.firstName)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
            
            TextField("Surname", text: $presenter.surname)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
            
            TextField("Email", text: $presenter.email)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
            
            SecureField("Password", text: $presenter.password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
            
            Button(action: {
                self.presenter.register()
            }) {
                ButtonContent(text: "Register")
            }
            .padding(.bottom, 50)
            
        }
        .padding()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = RegisterInteractor(service: UserService())
        let presenter = RegisterPresenter(interactor: interactor)
        return NavigationView {
            RegisterView(presenter: presenter)
        }
    }
}
