//
//  LoadingBehavior.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation
import UIKit
import NVActivityIndicatorView

protocol LoadingBehavior : NVActivityIndicatorViewable{
    func showLoading()
    func hideLoading()
}

extension LoadingBehavior where Self : UIViewController{
    func showLoading(){
        view?.endEditing(true)
        startAnimating()
    }
    
    func hideLoading(){
        stopAnimating()
    }
}
