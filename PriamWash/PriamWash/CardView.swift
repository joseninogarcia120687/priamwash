//
//  CardView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 13/8/25.
//

import SwiftUI

struct CardView: View {
    
    var title: String
    var icon: String
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundColor(.white)
                .padding()
                .background(Color("BottomNavColor"))
                .clipShape(.circle)
            
            Text(title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
        }
        .frame(width: 140, height: 160)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    CardView(title: "Name of Laundry Shop", icon: "tshirt.fill")
}
