//
//  ApodEndPoint.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

struct ApodEndPoint{
    
    static func getApodEndpoint() -> Endpoint {
        let config = AppSetup.shared.apiSetting!.endPoints.apod
        
        let ep = Endpoint(scheme: config.scheme,
                          host: config.host,
                          path: config.path,
                          queryItem: [APIParams.accessKey : AppSetup.shared.apiSetting!.apiKey])
        return ep
        
    }
}
