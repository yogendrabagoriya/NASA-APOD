//
//  HomeVCViewModel.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation

protocol HomeVCPresenter: AnyObject{
    func apodHandler(apod: Apod)
    func failureHandler(info: AlertInfo)
}

class HomeVCViewModel{
    
    var api: ApodAPI?
    weak var presenter: HomeVCPresenter?
    
    init(api: ApodAPI){
        self.api = api
    }
}


extension HomeVCViewModel: HomeVCViewModelProtocol{
    
    func fetchPictureOfDay(queryParam: [String: String]) {
        global.async {
            self.api?.getPicture(queryParam: queryParam, completion: {[weak self] result in
                switch result{
                case .success(let apod):
                    self?.presenter?.apodHandler(apod: apod)
                    
                case .failure(let info):
                    self?.presenter?.failureHandler(info: info)
                }
            })
        }
    }
}
