//
//  SnoonuApp.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 08/09/2024.
//

import SwiftUI

@main
struct SnoonuApp: App {
   
    @StateObject private var coordinator = Coordinator()
    
    var body: some Scene {
        WindowGroup {
            LunchScreen()
                .environmentObject(coordinator)
        }
    }
}
