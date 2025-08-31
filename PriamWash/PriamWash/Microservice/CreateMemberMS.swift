//
//  CreateMemberMS.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 31/8/25.
//

import Foundation

struct CreateMemberMS {
    func createPOST(_ payload: CreateMemberRequestDto) async throws -> CreateMemberResponseDto {
        let url = URL(string: "https://admin-travellercrit.com/api/Member/CreateMember")!
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        req.httpBody = try JSONEncoder().encode(payload)
        
        let (data, response) = try await URLSession.shared.data(for: req)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(CreateMemberResponseDto.self, from: data)
    }
}
