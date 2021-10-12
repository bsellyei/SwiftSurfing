//
//  ProfileView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 10. 11..
//

import Foundation
import SwiftUI

struct ProfileView: View {
    private let presenter: ProfilePresenter
    
    init(presenter: ProfilePresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        VStack {
            Image("placeholder")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom, 5)
                
            List {
                Button(action: {
                    print("logout")
                }) {
                    ButtonContent(text: "Logout")
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(interactor: interactor)
        return NavigationView {
            ProfileView(presenter: presenter)
        }
    }
}
