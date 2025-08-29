//
//  LaundryShopListContentView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 18/8/25.
//

import SwiftUI

struct LaundryShopListContentView: View {
    
    @State var imageUrl : String
    @State var shopName : String
    @State var address : String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: imageUrl)){ phase in
                switch phase {
                    case .empty:
                        ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .frame(width: 120, height: 120)
                @unknown default:
                    EmptyView()
                }
            }//End of async image
            
            VStack {
                Text(shopName)
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(address)
                    .font(.system(size: 13))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxHeight: 90, alignment: .topLeading)
        }
    }
}

#Preview {
    LaundryShopListContentView(imageUrl: "https://media.gettyimages.com/id/1467054171/photo/front-view-of-laundry-building-exterior-with-laundry-machines-dryers-and-hanging-clothes.jpg?s=612x612&w=gi&k=20&c=L5hCbKJa345j-cOissm1X-SJn5V8FmNtxtU1knFCBQM=", shopName: "International Waters", address: "Blk 7 Lot 1 Magnolia Street Camella Homes")
}
