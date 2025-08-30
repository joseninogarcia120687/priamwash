//
//  AuthMemberMS.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 30/8/25.
//

import Foundation

struct AuthMemberMS {
    
    func createPOST(_ payload: AuthMemberRequestDto) async throws -> AuthMemberResponseDto {
        let url = URL(string: "https://admin-travellercrit.com/api/Member/AuthMember")!
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        req.httpBody = try JSONEncoder().encode(payload)
        
        let (data, response) = try await URLSession.shared.data(for: req)
        guard let http = response as? HTTPURLResponse, (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(AuthMemberResponseDto.self, from: data)
    }
    
    func test1() -> Int {
        return 1;
    }
}
