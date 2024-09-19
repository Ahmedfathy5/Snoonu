//
//  SignIn.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 09/09/2024.
//

import SwiftUI

struct CreateAccount: View {
    @State var textField: String = ""
    @Binding  var showSignInScreen: Bool
    @State private var keyboardHeight: CGFloat = 0
    var body: some View {
            NavigationStack {
                Text("Login or create an account")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                VStack {
                    TextField("Mobile Number", text: $textField)
                        .padding(.leading, 140)
                        .tint(.red)
                        .foregroundStyle(.black)
                        .frame(width: 350, height: 50)
                        .background(
                            Color.gray.opacity(0.2)
                        )
                        .keyboardType(.numberPad)
                    .cornerRadius(20)
                    .overlay(alignment: .leading) {
                        HStack(spacing: 0) {
                            Image(.qatar)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 70, height: 70)
                                
                            Text("+974")
                                .font(.title3.bold())
                                .offset(x: -10)
                            Image(systemName: "chevron.down")
                                .foregroundStyle(.gray)
                                .font(.footnote)
                                .offset(x: -3 ,y: 1)
                                .bold()
                              
                        }
                        
                           
                    }
                    
                    Button(action: {}, label: {
                        Text("Continue")
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
                       Text("By clicking 'Continue' you agree with")
                            .foregroundStyle(.gray)
                            .frame(width: 309)
                            .lineLimit(2)
                        HStack(spacing: 5) {
                            Text("our")
                                .foregroundStyle(.gray)
                            Text("Terms and conditions")
                        }
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(.bottom, keyboardHeight)
                    .onAppear {
                        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notification in
                            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                                keyboardHeight = keyboardFrame.height - 270
                            }
                        }
                        
                        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { _ in
                            keyboardHeight = 0
                        }
                    }
                    .onDisappear {
                        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
                        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
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
                                Text("Skip")
                                    .foregroundStyle(.black)
                                    .bold()
                                    .background(
                                        Rectangle()
                                            .frame(width: 50, height: 30)
                                            .foregroundStyle(.gray.opacity(0.3))
                                            .cornerRadius(13)
                                    )
                            }
                        }
                    }
                }
            }
        }
    }


#Preview {
    CreateAccount(showSignInScreen: .constant(false))
}
