//
//  ReservationView.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 09. 27..
//

import SwiftUI

struct ReservationView: View {
    @ObservedObject var presenter: ReservationPresenter
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(presenter: ReservationPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("\(presenter.couch.city), \(presenter.couch.country)")
                    .font(.title)
                
                Spacer()
            }
            
            HStack {
                Label {
                    Text("User's name")
                } icon: {
                    Image(systemName: "keyboard")
                }
                
                Spacer()
            }
            
            Stepper("Max. number of guests: \(presenter.reservation.guestsNum)", value: $presenter.reservation.guestsNum,
                    in: 1...presenter.maxGuests)
            
            HStack {
                Text("Selected date: ")
                    .font(.title3)
                
                Spacer()
                
                Text("\(presenter.reservation.date)")
                    .font(.title3)
            }
            
            Spacer()
            
            Button(action: {
                presenter.add()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                ButtonContent(text: "Confirm")
            }
        }
        .onAppear(perform: presenter.loadData)
        .padding()
        .alert(isPresented: $presenter.showAlert) {
            Alert(title: Text("Creating reservation failed."), message: Text("Please try again."), dismissButton: .default(Text("Try again")))
        }
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        let interactor = ReservationInteractor(couchService: CouchService(), userService: UserService(), reservationService: ReservationService(), conversationService: ConversationService(), messageService: MessageService())
        let presenter = ReservationPresenter(interactor: interactor, reservation: Reservation())
        return ReservationView(presenter: presenter)
    }
}
