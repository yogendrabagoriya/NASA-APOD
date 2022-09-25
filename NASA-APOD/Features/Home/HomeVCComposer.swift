//
//  HomeVCComposer.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation
import UIKit

struct HomeVCComposer{
    
    /**
        This method coposed HomeViewController.
        It configures NetworkManager, GSApodAPI, HomeVCViewModel and HomeViewController.
        HomeViewController having dependecy of HomeVCViewModel that confirms HomeVCViewModelProtocol protocol
     */
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
