//
//  SnoonuApp.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 08/09/2024.
//

import SwiftUI
import SwiftfulRouting

@main
struct SnoonuApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                LunchScreen()
            }
        }
    }
}
