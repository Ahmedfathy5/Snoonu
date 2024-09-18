//
//  Resturants.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 09/09/2024.
//

import SwiftUI

struct Resturants: View {
    //MARK: - Properties.
    @State var index = 0
    @State var textField: String = ""
    let icons: [String] = [
        "heart.fill", "globe", "house.fill", "person.fill","heart.fill", "globe", "house.fill", "person.fill"
    ]
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    var body: some View {
        
        ScrollView {
            VStack {
                adressOfUser
                search
                tabViewsPictures
                resturantCategory
                serviceResturants
                bestLunch
               foodDelivery
                
            }
            .padding(.horizontal, 3)
        }
        .scrollIndicators(.hidden, axes: .vertical)
    }
    //MARK: - Components of Views.
    private var adressOfUser: some View {
        VStack {
            Text("Other")
                .font(.footnote)
                .fontWeight(.medium)
                .background(
                Rectangle()
                    .foregroundStyle(.gray.opacity(0.4))
                    .frame(width: 52, height: 25)
                    .cornerRadius(6, corners: [.topLeft,.topRight, .bottomLeft])
                )
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 6)
            HStack {
                Text("Qatar,Doha,Doha")
                    .font(.title2)
                    .bold()
                Button(action: {}, label: {
                    Image(systemName: "chevron.down")
                        .font(.footnote)
                        .bold()
                })
                .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
        
    }
    private var search: some View {
        VStack {
            TextField("Looking for something specific?", text: $textField)
                .padding(.horizontal, 40)
                .tint(.gray)
                .frame(maxWidth: .infinity)
                .frame( height: 50)
                .background(
                    Color.gray.opacity(0.2)
                )
                .cornerRadius(25)
                .overlay {
                    Image(systemName: "magnifyingglass")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .foregroundStyle(.gray)
                }
        }
    }
    private var tabViewsPictures: some View {
        VStack {
            TabView {
                ForEach(icons, id: \.self) { icon in
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .padding(30)
                }
            }
            .background( Color.red )
            .frame(height: 150)
            .cornerRadius(20)
            .tabViewStyle(PageTabViewStyle())
        }
    }
    private var resturantCategory: some View {
        VStack {
            LazyVGrid(columns: columns, alignment: .center, spacing: 0, content: {
                ForEach(0 ..< 8) { _ in
                    ResturantView()
                }
            })
        }
    }
    private var serviceResturants: some View {
        VStack(spacing: 0) {
          headerSection(sectionTitle: "Services", seeMoreTitle: "See all", showNew: false)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0 ..< 10) { int in
                        ResturantView()
                    }
                }
               
            }
         
            .scrollIndicators(.hidden, axes: .horizontal)
        }
    }
    private var bestLunch: some View {
        VStack {
            headerSection(sectionTitle: "Best Lunch", seeMoreTitle: "See all", showNew: true)
            ScrollView(.horizontal) {
                
                HStack {
                    ForEach(0 ..< 10) { Int in
                        Image(.food7)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .cornerRadius(15)
                            .overlay (
                                Text("Burger")
                                    .font(.title2)
                                    .bold()
                                    .foregroundStyle(.white)
                                    .frame(maxHeight: .infinity, alignment: .bottom)
                                    .padding(.bottom, 5)
                            )
                    }
                }
               
            }
           
            .scrollIndicators(.hidden)
        }
    }
    private var foodDelivery: some View {
        VStack {
            Text("Food")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            HStack(spacing: 6) {
                HStack(spacing: 0) {
                    Image(systemName: "figure.outdoor.cycle")
                    Text("Delivery")
                }
                .foregroundStyle(index == 0 ? .white : .black)
                .bold()
                .padding(.vertical, 10)
                .padding(.trailing)
                .offset(x: 6)
                .background( .black.opacity(index == 0 ? 1 : 0) )
                .clipShape(Capsule())
                .onTapGesture {
                    index = 0
                }
                
                HStack {
                    Image(systemName: "handbag")
                    Text("Takeaway")
                }
                .foregroundStyle(index == 1 ? .white : .black)
                .bold()
                .padding(.vertical, 10)
                
                .padding(.trailing)
                .offset(x: 6)
                .background(.black.opacity(index == 1 ? 1 : 0) )
                .clipShape(Capsule())
                .onTapGesture {
                    index = 1
                }
               
                HStack {
                    Image(systemName: "car.fill")
                    Text("Drive Thru")
                }
                .foregroundStyle(index == 2 ? .white : .black)
                .bold()
                .padding(.vertical, 10)
                .padding(.trailing)
                .offset(x: 6)
                .background(.black.opacity(index == 2 ? 1 : 0))
                .clipShape(Capsule())
                .onTapGesture { index = 2 }
            }
            .animation(.easeInOut, value: index)
            .background(.black.opacity(0.06))
            .frame(height: 50)
            .clipShape(Capsule())
            .padding(.horizontal, 5)
            
        }
        
    }
}

#Preview {
    Resturants()
}
