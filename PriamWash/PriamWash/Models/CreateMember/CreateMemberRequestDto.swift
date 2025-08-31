//
//  CreateMemberRequestDto.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 31/8/25.
//

import Foundation

struct CreateMemberRequestDto : Codable {
    let firstname: String
    let lastname: String
    let password: String
    let gender: String
    let mobileNumber: String
    let emailAddress: String
}
