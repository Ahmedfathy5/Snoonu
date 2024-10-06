//
//  MapAdress.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 09/09/2024.
//

import SwiftUI
import MapKit
import SwiftfulRouting

struct LocationView: View {
    
   let myHome = CLLocationCoordinate2D(latitude: 31.07953, longitude: 31.40379)
    @State var textField: String = ""
    @Environment(\.router) var router
    
    var body: some View {
            ZStack {
                if #available(iOS 17.0, *) {
                    Map() {
                       
                        Marker("Developer's Home",systemImage: "building", coordinate: myHome)
                            .tint(.blue)
                    }
                        .ignoresSafeArea()
                } else {
                   
                }
                
                VStack(spacing: -400) {
                    Image(systemName: "location")
                        .font(.title)
                        .background(
                        Rectangle()
                            .frame(width: 60, height: 60)
                            .foregroundStyle(.white)
                            .cornerRadius(30)
                        )
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding()
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.white)
                        .overlay {
                            VStack {
                                Text("Select location")
                                    .font(.title)
                                    .bold()
                                    .foregroundStyle(.black)
                                    .offset(y: 12)
                                
                                TextField("Search", text: $textField)
                                    .multilineTextAlignment(.leading)
                                    .padding(.horizontal, 40)
                                    .foregroundStyle(.black)
                                    .bold()
                                    .frame(width: 350, height: 50)
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
                                
                                Button {
                                    router.showScreen(.push) { _ in
                                        TabViews()
                                    }
                                } label: {
                                       Text("Confirm location")
                                            .font(.title3)
                                            .bold()
                                            .foregroundColor(.white)
                                            .frame(width: 350, height: 50)
                                            .background(
                                                Color.snoonuBackground
                                            )
                                            .opacity(textField.isEmpty ? 0.4 : 1)
                                            .cornerRadius(25)
                                }
                            }
                            .offset(y: -15)
                        }
                        .frame(height: 200)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .ignoresSafeArea()
                }
            }
    }
}


#Preview {
    LocationView()
}
