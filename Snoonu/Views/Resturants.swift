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
        "food5", "food6", "food7", "food8","food9"
    ]
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    @StateObject var viewModel: ViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: ViewModel(dataModel: Resturant(meals: [])))
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                adressOfUser
                search
                tabViewsPictures
                resturantCategory
                serviceResturants
                bestLunch
                foodDelivery
                foodDeliveryItem
                FoodCategory()
                    .offset(y: -30)
                superSaverDeals
            }
            .padding(.horizontal, 3)
            .onAppear {
                viewModel.fetchData()
            }
        }
        .scrollIndicators(.hidden, axes: .vertical)
        .toolbar(.hidden)
        
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
        LazyVStack {
            ZStack {
                ForEach(0 ..< icons.count, id: \.self) { index in
                    Image(icons[index])
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 20,height: 200)
                        .offset(x: CGFloat(currentIndex == index ? 0 : (currentIndex > index ? -1 : 1)) * UIScreen.main.bounds.width)
                        .cornerRadius(15)
                        .animation(.easeInOut(duration: 0.5), value: currentIndex)
                }
            }
            
            HStack {
                ForEach(0 ..< icons.count, id: \.self) { index in
                    Rectangle()
                        .cornerRadius(15)
                        .foregroundStyle(currentIndex == index ? .black : .gray.opacity(0.2))
                        .frame(width: 45, height: 3)
                    
                        .animation(.easeInOut(duration: 0.5), value: currentIndex)
                }
            }
            .padding(.top, 16)
        }
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % icons.count
            }
        }
        
    }
    private var resturantCategory: some View {
        LazyVStack {
            if viewModel.isLoading {
                LazyVGrid(columns: columns, alignment: .center, spacing: 0) {
                    ForEach(viewModel.dataModel.meals, id: \.self) { item in
                        if let imageURL = URL(string: item.mealImage) {
                            ResturantItem(name: item.mealName, url: imageURL)
                        }
                    }
                }
            } else {
                LazyVGrid(columns: columns, alignment: .center, spacing:6) {
                    ForEach(0..<10) { _ in
                        Rectangle()
                            .frame(width: 90, height: 90)
                            .foregroundStyle(.gray.opacity(0.5))
                            .cornerRadius(15)
                            .shimmering()
                    }
                }
            }
        }
    }
    private var serviceResturants: some View {
        VStack(spacing: 0) {
            HeaderSection(sectionTitle: "Services", seeMoreTitle: "See all", showNew: true)
                .padding(.horizontal, 5)
            ScrollView(.horizontal) {
                LazyHStack {
                    if viewModel.isLoading {
                        ForEach(viewModel.dataModel.meals, id: \.self) { item in
                            if let imageURL = URL(string: item.mealImage) {
                                ResturantItem(name: item.mealName, url: imageURL)
                            }
                        }
                    } else {
                        HStack {
                            ForEach(0..<15) { _ in
                                Rectangle()
                                    .frame(width: 90, height: 90)
                                    .foregroundStyle(.gray.opacity(0.5))
                                    .cornerRadius(15)
                                    .shimmering()
                            }
                        }
                    }
                }
            }
            .scrollIndicators(.hidden, axes: .horizontal)
        }
    }
    private var bestLunch: some View {
        VStack {
            HeaderSection(sectionTitle: "Best Lunch", seeMoreTitle: "See all", showNew: false)
                .padding(.horizontal, 5)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(viewModel.dataModel.meals, id: \.self) { item in
                        Image(.food7)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .cornerRadius(15)
                        
                            .overlay (
                                Text(item.mealName)
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
        LazyVStack {
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
    private var foodDeliveryItem: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(icons, id: \.self) { item in
                    VStack(spacing: 4) {
                        Image(.food3)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(25)
                        
                        Text(item)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 75, height: 50)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .offset(y: -20)
                    }
                    
                }
            }
        }
        .scrollIndicators(.hidden)
    }
    private var superSaverDeals: some View {
        VStack {
            HStack {
                Text("⚡️Super Saver Deals")
                    .font(.title)
                    .fontWeight(.black)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("See all")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.snoonuBackground)
            }
            .padding(.horizontal, 5)
            VStack(spacing: 12) {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0 ..< 10) { item in
                            ResturantDeals(width: 280, height: 120)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                ScrollView(.vertical) {
                    ForEach(0 ..< 10) { item in
                        ResturantDeals(width: 380, height: 120)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    Resturants()
}
