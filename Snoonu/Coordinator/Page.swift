//
//  Page.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 03/10/2024.
//

import Foundation

enum Page: Hashable {
    case lunchScreen
    case locationView
    case tabView
}

enum FullScreenCover: String, Identifiable {
   case createAccount
   
   var id: String {
       self.rawValue
   }
}
