//
//  Helper.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 30/8/25.
//

import Foundation
import SwiftUI

struct Helper {
    static func isValidEmail(_ raw: String) -> Bool {
        let email = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard email.utf8.count <= 254, let at = email.firstIndex(of: "@") else { return false }
        guard email[..<at].utf8.count <= 64 else { return false }
        
        let pattern = #"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$"#
        return email.range(of: pattern, options: [.regularExpression, .caseInsensitive]) != nil
    }
}
