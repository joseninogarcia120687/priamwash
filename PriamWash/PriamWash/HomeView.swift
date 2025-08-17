//
//  HomeView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 13/8/25.
//

import SwiftUI

struct HomeView: View {
    
    let shops = [
        ("Find Laundry Shop", "location.fill"),
        ("Find Laundry Attendant", "tshirt.fill"),
        ("Add Your Business", "house.lodge"),
        ("Report Incident", "exclamationmark.bubble.fill"),
        ("Be a Laundry Attendant", "person.line.dotted.person")
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 150, height: 150)
                
                Text("How can we help you?")
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(EdgeInsets(top: -20, leading: 10, bottom: 0, trailing: 10))
                    .font(.system(size: 21))
                    .fontWeight(.bold)
                    .foregroundColor(Color("BottomNavColor"))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16){
                        ForEach(shops, id: \.0){ shop in
                            CardView(title: shop.0, icon: shop.1)
                        }
                    }
                    .padding(10)
                    
                }
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    HomeView()
}
