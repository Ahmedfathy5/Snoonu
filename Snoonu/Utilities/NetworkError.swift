//
//  ApiError.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 23/09/2024.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case errorInResponse
    case decodingFaild
    
    
    var description: String? {
        switch self {
        case .badURL:
            return "not a valid URL"
        case .errorInResponse:
            return "Server is not Reachble"
        case .decodingFaild:
          return  "Json failed"
        }
    }
}
