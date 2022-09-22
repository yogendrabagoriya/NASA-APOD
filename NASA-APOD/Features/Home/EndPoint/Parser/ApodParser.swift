//
//  ApodParser.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

protocol ApodParser{
    func parseApod(_ data: Data, from response: HTTPURLResponse) throws -> (Apod)
}
