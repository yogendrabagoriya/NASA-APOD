//
//  NetworkClient.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

protocol NetworkClient: AnyObject{
    
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Swift.Error>
    
    func get(from url: URL, completionHandler: @escaping (Result) -> Void)
}
