//
//  TabViews.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 09/09/2024.
//

import SwiftUI

struct TabViews: View {
    @State private var selectedTab: Int = 1
    @State private var showSignInScreen: Bool = false
    var body: some View {
       
            TabView(selection: $selectedTab) {
                Resturants()
                     .tabItem {
                         Image(systemName: "frying.pan")
                         Text("Food") }
                     .tag(1)
                
                Charities()
                    .tabItem {
                        Image(systemName: "window.awning")
                        Text("Grocery") }
                    .tag(2)
                
                
                AllServies()
                     .tabItem {
                         Image(systemName: "square.grid.3x3.topleft.filled")
                         Text("All Service") }
                     .tag(3)
                
                ClubRewards()
                    
                    .tabItem {
                        Image(systemName: "banknote")
                        Text("Rewards Club") }
                    .tag(4)
                    .onAppear {
                        if !showSignInScreen {
                            showSignInScreen = true
                        }
                    }
                
                Account()
                    .tabItem {
                            Image(systemName: "person.circle.fill")
                            Text("Profile")
                    }
                    .tag(5)
                    .onAppear{
                        if !showSignInScreen {
                            showSignInScreen = true
                        }
                    }
                
                
            }
            .accentColor(.snoonuBackground)
            .fullScreenCover(isPresented: $showSignInScreen, content: {
                CreateAccount( showSignInScreen: $showSignInScreen)
            })
       


        

      
    }
}

#Preview {
    TabViews()
}
