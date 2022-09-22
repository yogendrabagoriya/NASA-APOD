//
//  CodableExt.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

struct DecodingError<T>: LocalizedError {
    public let type: T.Type
    public let dictionary: [String: Any]
    public let error: Swift.Error
    
    public var errorDescription: String? {
        return "Could not convert JSON to entity of type \(type) \n\nError: \(error) \n\nDictionary:\(dictionary)"
    }
}

extension Decodable
{
    public static func from(_ dictionary: [String: Any] ) throws
    -> Self {
        do{
            let data = try JSONSerialization.data (withJSONObject: dictionary, options: .prettyPrinted)
            let decoder = JSONDecoder()
            return try decoder.decode(self, from: data)
        } catch{
            let error = DecodingError(type: self, dictionary: dictionary, error: error)
            throw error
        }
    }
    
    public static func from(plistNamed name: String, in bundle: Bundle = Bundle.main) throws -> Self {
        let path = bundle.path(forResource: name, ofType: "plist")!
        let plistDict = NSDictionary(contentsOfFile: path) as! [String: Any]
        return try from(plistDict)
    }
    
}
