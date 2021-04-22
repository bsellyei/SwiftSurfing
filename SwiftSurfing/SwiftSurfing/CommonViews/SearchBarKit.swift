//
//  SearchBar.swift
//  SwiftSurfing
//
//  Created by Séllyei Bence on 2021. 04. 14..
//

import SwiftUI
import UIKit

struct SearchBarKit: UIViewRepresentable {
    private var searchOperation: (String) -> Void
    
    init(searchOperation: @escaping (String) -> Void) {
        self.searchOperation = searchOperation
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.autocorrectionType = .no
        searchBar.delegate = context.coordinator
        searchBar.showsCancelButton = false
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        var parent: SearchBarKit
        
        init(_ parent: SearchBarKit) {
            self.parent = parent
        }
        
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = true
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            parent.searchOperation(searchBar.text ?? "")
            searchBar.text = ""
            searchBar.showsCancelButton = false
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.text = ""
            searchBar.showsCancelButton = false
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
