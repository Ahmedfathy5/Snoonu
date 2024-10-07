//
//  headerSection.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 09/09/2024.
//

import SwiftUI

struct HeaderSection: View {
   @State var sectionTitle: String
   @State var seeMoreTitle: String
   @State var showNew: Bool
   @State var index: Int = 0
    var body: some View {
      
       
        HStack(spacing: 10) {
            
            Text(sectionTitle)
                .font(.title2)
                .bold()
            Text("New")
                .foregroundStyle(.white)
                .bold()
                .background(
                    Rectangle()
                        .foregroundStyle(.red)
                        .frame(width: 50, height: 25)
                        .cornerRadius(15)
                )
                .opacity(showNew ? 1 : 0)
            Spacer()
            RoundedCorner()
                .foregroundStyle(.gray.opacity(0.2))
                .frame(width: 100, height: 30)
                .overlay {
                    Text(seeMoreTitle)
                        .bold()
                }
           
        }
        
       
    }
}

#Preview {
    HeaderSection(sectionTitle: "Service", seeMoreTitle: "See all", showNew: true)
}
