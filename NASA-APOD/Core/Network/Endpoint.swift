//
//  Endpoint.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

struct Endpoint{
    private(set) var scheme : String
    private(set) var host : String
    private(set) var path : String
    private(set) var parameters: [String: Any]
    private(set) var queryItem: [String: String]?
    
    init(scheme: String, host : String, path : String, parameters: [String: Any] = [:], queryItem: [String: String] = [:]) {
        self.scheme = scheme
        self.host = host
        self.path = path
        self.parameters = parameters
        self.queryItem = queryItem
    }
    
    public enum Error : Swift.Error{
        case cantBuidURL
        case cantRemovePercentEncoding
    }
}

extension Endpoint {
    
    var url: URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        var queryItemsArr = [URLQueryItem]()
        queryItem?.forEach({ (k, v) in
            let item = URLQueryItem(name: k, value: v)
            queryItemsArr.append(item)
        })
        if queryItemsArr.count > 0{
            components.queryItems = queryItemsArr
        }
        
        return components
    }
}
