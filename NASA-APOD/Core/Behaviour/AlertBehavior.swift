//
//  AlertBehavior.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation
import UIKit

protocol AlertBehavior{
    func showAlert(alertInfo: AlertInfo)
    func showAlert(title: String, message: String?, okBtnText: String)
}


extension AlertBehavior where Self : UIViewController{
    
    func showAlert(alertInfo: AlertInfo){
        self.showAlert(title: alertInfo.title, message: alertInfo.message, okBtnText: "Ok")
    }
    
    func showAlert(title: String, message: String?, okBtnText: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: okBtnText, style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
