//
//  ResturantView.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 09/09/2024.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct ResturantItem: View {
    @State var name: String
    
    
    
    let url: URL
    
    var body: some View {
        
        ZStack {
            RoundedCorner(radius: 15)
                .foregroundStyle(.white)
                .frame(width: 100, height: 120)
            VStack {
                WebImage(url: url)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .cornerRadius(15)
                
                
                Text(name)
                    .font(.system(size: 15))
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    ResturantItem(name: "salad",url: URL(filePath: ""))
}
