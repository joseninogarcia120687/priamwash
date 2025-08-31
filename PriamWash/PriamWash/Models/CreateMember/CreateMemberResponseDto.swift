//
//  CreateMemberResponseDto.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 31/8/25.
//

import Foundation

struct CreateMemberResponseDto: Decodable {
    let sucess: Bool
    let returnCode: String
    let returnMessage: String
    let payload: CreateMemberPayloadDto?
    let errors: [ErrorDto]?
}
