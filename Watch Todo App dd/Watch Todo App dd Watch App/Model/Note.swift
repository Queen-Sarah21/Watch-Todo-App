//
//  Note.swift
//  Watch Todo App dd Watch App
//
//  Created by user269332 on 2/19/25.
//

import Foundation

// struct -> Identifiable, Codable (JSON/decode)
// id -> UUID
// text -> String

struct Note: Identifiable, Codable {
    var id: UUID
    var text: String
}
