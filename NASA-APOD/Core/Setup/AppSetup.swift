//
//  Appsetup.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation
class AppSetup{
    
    static let shared = AppSetup()
    
    private init(){
        
    }
    
    private(set) var apiSetting : APISettings?

    func initialize(){
        let configurator = Configurator()
        self.apiSetting = configurator.getAPISettings()
    }
}
