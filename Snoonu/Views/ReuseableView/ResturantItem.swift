//
//  ResturantView.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 09/09/2024.
//

import SwiftUI

struct ResturantItem: View {
    @State var name: String
    
  
    
    @StateObject private var imageLoader = ImageLoader()
        let url: URL
    var body: some View {
        
        ZStack {
            RoundedCorner(radius: 15)
                .foregroundStyle(.white)
                .frame(width: 100, height: 120)
            VStack {
                if let image = imageLoader.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .cornerRadius(15)
                }
             
                Text(name)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
            }
        }
        .onAppear{
            imageLoader.loadImage(from: url)
        }
        .onDisappear{
            imageLoader.cancel()
        }
    }
}

#Preview {
    ResturantItem(name: "salad",url: URL(filePath: ""))
}
