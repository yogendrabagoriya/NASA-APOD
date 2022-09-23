//
//  ApodEndPoint.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

struct ApodEndPoint{
    
    static func getApodEndpoint(querParam: [String: String]) -> Endpoint {
        let config = AppSetup.shared.apiSetting!.endPoints.apod
        var temp = querParam
        temp.updateValue(AppSetup.shared.apiSetting!.apiKey, forKey: APIParams.accessKey)
        
        let ep = Endpoint(scheme: config.scheme,
                          host: config.host,
                          path: config.path,
                          queryItem: temp)
        return ep
        
    }
}
