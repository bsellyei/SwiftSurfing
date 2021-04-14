//
//  SearchBar.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 04. 14..
//

import SwiftUI

struct SearchBarKit: UIViewRepresentable {
    private var text: String
    var searchOperation: () -> Void
    
    init(text: String, searchOperation: @escaping () -> Void) {
        self.text = text
        self.searchOperation = searchOperation
    }
    
    func makeUIView(context: Context) -> UITextField {
        let searchBar = UITextField(frame: .zero)
        searchBar.keyboardType = .default
        searchBar.returnKeyType = .search
        searchBar.autocorrectionType = .no
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: SearchBarKit
        
        init(_ parent: SearchBarKit) {
            self.parent = parent
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            parent.searchOperation()
            return true
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarKit(text: "", searchOperation: { })
    }
}
