//
//  ApodAPI.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

protocol ApodAPI: AnyObject{
    typealias Result = APIResult<Apod>
    typealias Completion = ((Result)->())
    
    func getPicture(queryParam: [String: String], completion: @escaping Completion)
}
