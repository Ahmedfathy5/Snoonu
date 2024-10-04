//
//  ResturantDeals.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 18/09/2024.
//

import SwiftUI

struct ResturantDeals: View {
    @State var width: CGFloat
    @State var height: CGFloat
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                .frame(width: width, height: 180)
                .foregroundStyle(.white)
                .shadow(radius: 5)
                .overlay(alignment:.top){
                    VStack(spacing: 4) {
                        Image(.food5)
                            .resizable()
                            .frame(width: width, height: height)
                            .cornerRadius(15, corners: [.topLeft,.topRight])
                            .overlay(alignment: .top) {
                                HStack {
                                    PrecentageView(precentage: 30, precentageShow: true)
                                        .padding(.horizontal, 5)
                                    Spacer()
                                    Favorite()
                                        .padding(.top, 5)
                                }
                            }
                            .overlay(alignment: .bottomTrailing) {
                                DeliveryArived(minutes: 25)
                            }
                        HStack {
                            Text("ad")
                                .font(.system(size: 13))
                                .foregroundStyle(.gray)
                                .background(
                                Rectangle()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(.gray.opacity(0.2))
                                    .cornerRadius(8)
                                )
                            Text("The Smoking Patty")
                                .font(.title3)
                                .fontWeight(.heavy)
                        }
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            Text("3.2")
                                .bold()
                            Text("Mahshi Enab Faajer")
                                .font(.footnote)
                                .bold()
                                .foregroundStyle(.gray)
                        }
                    }
                }

        }
    }
}

struct PrecentageView: View {
   @State var precentage: Int
    @State var precentageShow: Bool
    var body: some View {
        VStack {
           Rectangle()
                .foregroundStyle(.snoonuBackground)
                .frame(width: 90, height: 35)
                .cornerRadius(15)
                .overlay {
                    HStack {
                        Text("\(precentage)% Off")
                            .foregroundStyle(.white)
                            .font(.system(size: 20))
                            .bold()
                    }
                }
        }
        .opacity(precentageShow ? 1 : 0)
        
    }
}
struct Favorite: View {
    var body: some View {
        VStack {
            RoundedCorner(radius: 25, corners: [.allCorners])
                .frame(width: 50, height: 50)
                .foregroundStyle(.black.opacity(0.85))
                .overlay(alignment: .center) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.white)
                        
                }
                
        }
    }
}
struct DeliveryArived: View {
   @State var minutes: Int
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 100, height: 35)
                .foregroundStyle(.black.opacity(0.85))
                .cornerRadius(15, corners: .topLeft)
                .overlay {
                    HStack(spacing: 2) {
                        Image(systemName: "figure.outdoor.cycle")
                        Text("\(minutes) mins")
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    
                }
        }
    }
}

#Preview {
    VStack(spacing: 60) {
        ResturantDeals(width: 370, height: 160)
        PrecentageView(precentage: 30, precentageShow: true)
        Favorite()
        DeliveryArived(minutes: 22)
    }
}
