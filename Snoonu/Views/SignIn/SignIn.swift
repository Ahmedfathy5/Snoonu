//
//  SignIn.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 09/09/2024.
//

import SwiftUI

struct SignIn: View {
    @State var textField: String = ""
    @Binding  var showSignInScreen: Bool
    var body: some View {
            NavigationStack {
                Text("سجل الدخول أو أنشئ حساب")
                    .font(.largeTitle)
                    .bold()
                VStack {
                    TextField("رقم جوال المستلم", text: $textField)
                        .multilineTextAlignment(.trailing)
                        .padding(.trailing, 120)
                        .tint(.gray)
                        .frame(width: 350, height: 50)
                        .background(
                            Color.gray.opacity(0.2)
                        )
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.numberPad)
                    .cornerRadius(25)
                    
                    .overlay {
                        HStack {
                            Image(.qatar)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 70, height: 70)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.horizontal,-20)
                            
                            Text("+974")
                                .font(.title3.bold())
                                .padding(.leading, -90)
                            Image(systemName: "chevron.down")
                                .foregroundStyle(.gray)
                                .font(.footnote)
                                .offset(y: 1)
                                .bold()
                                .padding(.leading, -118)
                        }
                        
                           
                    }
                    
                    Button(action: {}, label: {
                        Text("متابعة")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 350, height: 50)
                            .background(
                                Color.snoonuBackground
                            )
                            .cornerRadius(25)
                    })
                    VStack {
                       Text("بالضغط علي زر المتابعة أنت توافق علي ")
                            .foregroundStyle(.gray)
                        Text("الشروط والأحكام")
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            
                        } label: {
                            NavigationLink {
                                TabViews()
                            } label: {
                                Image(systemName: "arrow.backward")
                                    .foregroundStyle(.black)
                                    .bold()
                                    .background(
                                        RoundedCorner()
                                            .clipShape(Circle())
                                            .frame(width: 40, height: 40)
                                            .foregroundStyle(.gray.opacity(0.3))
                                    )
                            }
                        }
                    }
                }
            }
        }
    }


#Preview {
    SignIn(showSignInScreen: .constant(false))
}
