//
//  AuthMemberPayloadDto.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 30/8/25.
//

import Foundation

struct AuthMemberPayloadDto: Codable {
    let isAuthenticated: Bool
    let userID: String
    let lastLoggedIn: String
}
