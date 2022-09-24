//
//  Constants.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

enum APIParams {
    static let accessKey = "api_key"
}


// DispatchQueue related
public var main: DispatchQueue { return DispatchQueue.main }
public var global: DispatchQueue { return DispatchQueue.global()}
