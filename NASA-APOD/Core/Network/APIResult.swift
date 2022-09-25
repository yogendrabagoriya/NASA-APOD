//
//  APIResult.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

enum APIResult<T>{
    case success(T)
    case failure(AlertInfo)
}
