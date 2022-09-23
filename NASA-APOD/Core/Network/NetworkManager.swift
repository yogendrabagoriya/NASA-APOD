//
//  NetworkManager.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

class NetworkManager: NetworkClient{
    
    private let session: URLSession
        
    public init(session: URLSession) {
        self.session = session
    }
    
    /**
        This function is used for simple data task
     */
    func get(from url: URL, completionHandler: @escaping (NetworkClient.Result) -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
             if let error = error {
                completionHandler(.failure(error))
            }else if let data = data, let response = response as? HTTPURLResponse {
                completionHandler(.success((data, response)))
            }
        }
        task.resume()
    }
    
    /**
        This function downloads any file from url.
     */
    func download(from fileUrl: URL, completionHandler: @escaping (NetworkClient.Result) -> Void){
        session.downloadTask(with: fileUrl) { tempURL, urlResponse, error in
            guard let tempURL = tempURL else {
                completionHandler(.failure(error!))
                return
            }
            
            if let error = error {
               completionHandler(.failure(error))
            }else if let data = try? Data(contentsOf: tempURL), let response = urlResponse as? HTTPURLResponse {
                completionHandler(.success((data, response)))
            }
        }
    }
}
