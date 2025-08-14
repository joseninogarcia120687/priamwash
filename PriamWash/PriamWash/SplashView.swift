//
//  SplashView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 13/8/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .scaledToFit()
            
            Text("Version 1.0")
                .foregroundColor(.blue)
                .bold()
        }
        .padding()
    }
}

#Preview {
    SplashView()
}
