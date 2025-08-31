//
//  AuthMemberResponseDto.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 30/8/25.
//

import Foundation

struct AuthMemberResponseDto : Decodable {
    let sucess: Bool
    let returnCode: String
    let payload: AuthMemberPayloadDto?
    let errors: [ErrorDto]?
}
