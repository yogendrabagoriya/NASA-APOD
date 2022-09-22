//
//  AlertInfo.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

struct AlertInfo{
    let title: String
    let message: String?
    
    init(title: String, message: String){
        self.title = title
        self.message = message
    }
}

extension AlertInfo{
    
    static func couldNotLoad(error: Error) ->(AlertInfo){
        let errorAlert = AlertInfo(title: "Error", message: error.localizedDescription)
        return errorAlert
    }
    
    static func gerneralisedAlertInfo(error: Error) ->(AlertInfo){
        let errorAlert = AlertInfo(title: "Error", message: error.localizedDescription)
        return errorAlert
    }
    
}
