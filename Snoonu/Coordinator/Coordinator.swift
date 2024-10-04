//
//  Coordinator.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 03/10/2024.
//

import SwiftUI

final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var fullScreenCover: FullScreenCover?
    
    func push(page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func present(_ cover: FullScreenCover) {
        self.fullScreenCover = cover
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .lunchScreen:
            LunchScreen()
        case .locationView:
            LocationView()
        case .tabView:
            TabViews()
        }
    }
    
    @ViewBuilder
    func buildCover(cover: FullScreenCover) -> some View {
        switch cover {
        case .createAccount:
            NavigationStack {
                CreateAccount()
            }
        }
    }
}
