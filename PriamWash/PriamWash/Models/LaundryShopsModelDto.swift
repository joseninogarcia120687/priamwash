//
//  LaundryShopsModelDto.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 20/8/25.
//

import Foundation

struct LaundryShopsModelDto : Identifiable {
    let id = UUID()
    let shopName: String
    let coverPhoto: String
}
