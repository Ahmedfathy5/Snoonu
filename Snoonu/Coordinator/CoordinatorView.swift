//
//  CoordinatorView.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 03/10/2024.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject private var coordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .lunchScreen)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { cover in
                    coordinator.buildCover(cover: cover)
                }
        }
        .environmentObject(coordinator)
    }
}
