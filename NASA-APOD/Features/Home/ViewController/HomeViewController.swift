//
//  ViewController.swift
//  NASA-APOD
//
//  Created by Apple on 21/09/22.
//

import UIKit

protocol HomeVCViewModelProtocol{
    func fetchPictureOfDay()
}

class HomeViewController: NibViewController {

    var viewModel: HomeVCViewModelProtocol?
    
    init(viewModel: HomeVCViewModelProtocol) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.viewModel?.fetchPictureOfDay()
    }
}


extension HomeViewController: HomeVCPresenter{
    func apodHandler(apod: Apod){
        
    }
    
    func failureHandler(info: AlertInfo) {
        
    }
}
