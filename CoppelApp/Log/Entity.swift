//
//  Entity.swift
//  CoppelApp
//
//  Created by Mauricio Zarate on 02/05/22.
//

import Foundation

struct LogEntity: Codable{
    let request_token: String
}

struct Sesiones: Codable {
    let success: Bool
    let sessionID: String

    enum CodingKeys: String, CodingKey {
        case success
        case sessionID = "session_id"
    }
}
