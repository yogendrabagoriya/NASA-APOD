//
//  GSApodAPI.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

class GSApodAPI{
    var networkManager: NetworkClient
    var parser: ApodParser
    
    init(networkManager: NetworkClient, parser: ApodParser){
        self.networkManager = networkManager
        self.parser = parser
    }
}

extension GSApodAPI: ApodAPI{
    func getPicture(queryParam: [String: String], completion: @escaping Completion) {
        let endPoint = ApodEndPoint.getApodEndpoint(querParam: queryParam)
        self.networkManager.get(from: endPoint.url.url!) {[weak self] result in
            switch result{
                
            case .success((let data, let response)):
                do{
                    if let vehicle = try self?.parser.parseApod(data, from: response){
                        completion(.success(vehicle))
                    }
                    
                }catch (let error){
                    completion(.failure(.gerneralisedAlertInfo(error: error)))
                }
                
            case .failure(let error):
                completion(.failure(.gerneralisedAlertInfo(error: error)))
            }
        }
    }
}
