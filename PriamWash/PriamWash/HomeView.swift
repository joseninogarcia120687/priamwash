//
//  HomeView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 13/8/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var text = ""
    
    let shops = [
        ("Find a Laundry Attendant", "tshirt.fill"),
        ("Add Your Laundry Shop", "house.lodge"),
        ("Report Incident or other Issues", "exclamationmark.bubble.fill"),
        ("Be a Laundry Attendant", "person.line.dotted.person")
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 150, height: 150)
                Text("Discover Laundry Shops")
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                SearchFieldView(text: $text, placeholder: "Enter your preferred location...")
                    .padding(EdgeInsets(top: 2, leading: 10, bottom: 0, trailing: 10))
                Text("How can we help you?")
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(EdgeInsets(top: 15, leading: 10, bottom: 0, trailing: 10))
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16){
                        ForEach(shops, id: \.0){ shop in
                            CardView(title: shop.0, icon: shop.1)
                        }
                    }
                    .padding(10)
                }
                HStack {
                    Text("Nearby you")
                        .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                        .padding(EdgeInsets(top: 15, leading: 10, bottom: 0, trailing: 10))
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    HStack {
                        Image(systemName: "globe.europe.africa.fill")
                            .frame(maxWidth: 15, maxHeight: 30)
                        
                        Text("Manila, Philippines")
                            .frame(maxHeight: 30, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                            .font(.system(size: 10))
                            .foregroundColor(Color.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                }
                
                LaundryShopList()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    HomeView()
}
