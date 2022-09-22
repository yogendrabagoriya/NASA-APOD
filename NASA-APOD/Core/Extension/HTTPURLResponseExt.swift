//
//  HTTPURLResponseExt.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }
    
    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
