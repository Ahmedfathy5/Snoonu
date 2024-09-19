//
//  LunchScreen.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 08/09/2024.
//

import SwiftUI

struct LunchScreen: View {
    @State var isScaled: Bool = true
    @State var showNextScreen: Bool = false
    @State var showMessage: Bool = false
    var body: some View {
        Group {
            if showNextScreen {
                LocationView()
            } else {
                ZStack {
                    Color.snoonuBackground.ignoresSafeArea()
                    VStack {
                        Image(.snoonu)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .scaleEffect(isScaled ? 0.75 : 1.3)
                            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true))
                            .onAppear {
                                isScaled.toggle()
                            }
                            .frame(maxHeight: .infinity)
                            .frame(alignment: .bottom)
                        Spacer()
                        if showMessage {
                            ZStack {
                                Rectangle()
                                    .frame(width: 220, height: 50)
                                    .foregroundColor(.white)
                                    .cornerRadius(20, corners: [ .topLeft,.topRight, .bottomRight])
                                VStack {
                                    Text("Made in Qatar with love ❤️")
                                        .fontWeight(.semibold)
                                       
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .transition(.asymmetric(
                                insertion: .move(edge: .bottom),
                                removal: AnyTransition.opacity.animation(.easeInOut)
                            ))
                        }
                        
                       
                    }
                    
                }
            }
                
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showMessage = true
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation {
                    showNextScreen = true
                }
            }
        }
    }
}


#Preview {
    LunchScreen()
}
