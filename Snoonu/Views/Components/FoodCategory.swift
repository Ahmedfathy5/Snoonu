//
//  FoodCategory.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 18/09/2024.
//

import SwiftUI

struct FoodCategory: View {
    @State var index: Int?
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Image(systemName: "list.triangle")
                    .foregroundStyle( .black)
                    .bold()
                    .frame(width: 30, height: 30)
                    .background( .black.opacity(0.05))
                    .frame( alignment: .center)
                    .clipShape(Circle())
                
                HStack(spacing: 0) {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.red)
                    Text("Favorite")
                }
                .foregroundStyle(index == 0 ? .white : .black)
                .bold()
                .padding(.vertical, 5)
                .padding(.trailing)
                .offset(x: 6)
                .background( .black.opacity(index == 0 ? 1 : 0.05) )
                .clipShape(Capsule())
                .padding(.vertical, -5)
                .onTapGesture {
                    index = 0
                }
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text("Top Rated")
                }
                .foregroundStyle(index == 1 ? .white : .black)
                .bold()
                .padding(.vertical, 5)
                .padding(.trailing)
                .offset(x: 6)
                .background(.black.opacity(index == 1 ? 1 : 0.05) )
                .clipShape(Capsule())
                .onTapGesture { index = 1  }
                
                HStack {
                    Image(systemName: "bolt.horizontal.circle.fill")
                        .foregroundStyle(.blue)
                    Text("Free Delivery")
                }
                .foregroundStyle(index == 2 ? .white : .black)
                .bold()
                .padding(.vertical, 5)
                .padding(.trailing)
                .offset(x: 6)
                .background(.black.opacity(index == 2 ? 1 : 0.05))
                .clipShape(Capsule())
                .onTapGesture { index = 2 }
                
                HStack {
                    Image(systemName: "clock.fill")
                        .foregroundStyle(.purple)
                    Text("Under 30 min")
                }
                .foregroundStyle(index == 3 ? .white : .black)
                .bold()
                .padding(.vertical, 5)
                .padding(.trailing)
                .offset(x: 6)
                .background(.black.opacity(index == 3 ? 1 : 0.05) )
                .clipShape(Capsule())
                .onTapGesture {  index = 3   }
                
                HStack {
                    Text("$$$")
                }
                .foregroundStyle(index == 4 ? .white : .black)
                .bold()
                .padding(.vertical, 5)
                .padding(.trailing)
                .offset(x: 6)
                .background(.black.opacity(index == 4 ? 1 : 0.05) )
                .clipShape(Capsule())
                .onTapGesture {  index = 4   }
            }
            .animation(.easeInOut, value: index)
        
            .frame(height: 50)
            .clipShape(Capsule())
        .padding(.horizontal, 5)
        }
        .scrollIndicators(.hidden)
        
        
    }
}

#Preview {
    FoodCategory()
}
