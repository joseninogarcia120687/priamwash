//
//  AuthMemberRequestDto.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 30/8/25.
//

import Foundation

struct AuthMemberRequestDto: Codable {
    let emailAddress: String
    let password: String
}
