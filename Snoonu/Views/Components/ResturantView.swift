//
//  ResturantView.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 09/09/2024.
//

import SwiftUI

struct ResturantView: View {
    var body: some View {
        
        ZStack {
            RoundedCorner(radius: 15)
                .foregroundStyle(.white)
                .frame(width: 100, height: 120)
            VStack {
                Image(.food3)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                Text("Salad")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    ResturantView()
}
