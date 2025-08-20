//
//  LaundryShopList.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 18/8/25.
//

import SwiftUI

struct LaundryShopList: View {
    
    let shops = [
        LaundryShopsModelDto(shopName: "International Washers", coverPhoto: "https://media.gettyimages.com/id/1467054171/photo/front-view-of-laundry-building-exterior-with-laundry-machines-dryers-and-hanging-clothes.jpg?s=612x612&w=gi&k=20&c=L5hCbKJa345j-cOissm1X-SJn5V8FmNtxtU1knFCBQM=")
    ]
    
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing: 0) {
                ForEach(shops) { shop in
                    LaundryShopListContentView(imageUrl: shop.coverPhoto, shopName: shop.shopName)
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    LaundryShopList()
}
