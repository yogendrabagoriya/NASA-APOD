//
//  GSApodParser.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

public enum APIError: Swift.Error {
    case invalidData
}

struct GSApodParser: ApodParser{
    
    func parseApod(_ data: Data, from response: HTTPURLResponse) throws -> (Apod){
        
        guard response.isOK, let apod = try? JSONDecoder().decode(Apod.self, from: data) else {
            throw APIError.invalidData
        }
        
        return apod
    }
}
