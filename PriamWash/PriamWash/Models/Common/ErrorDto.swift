//
//  ErrorDto.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 30/8/25.
//

import Foundation

struct ErrorDto: Codable {
    let serviceName: String
    let messageCode: String
    let errorMessage: String
}
