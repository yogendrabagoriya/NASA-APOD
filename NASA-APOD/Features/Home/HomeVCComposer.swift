//
//  HomeVCComposer.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation
import UIKit

struct HomeVCComposer{
    
    static func makeHomeVC() -> (UIViewController) {
        let manager = NetworkManager(session: .shared)
        let parser = GSApodParser()
        let api = GSApodAPI(networkManager: manager, parser: parser)
        
        let viewModel = HomeVCViewModel(api: api)
        let vc = HomeViewController(viewModel: viewModel)
        
        viewModel.presenter = vc
        return vc
    }
    
}
