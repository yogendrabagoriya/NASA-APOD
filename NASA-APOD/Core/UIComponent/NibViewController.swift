//
//  NibViewController.swift
//  NASA-APOD
//
//  Created by Apple on 22/09/22.
//

import Foundation
import UIKit

class NibViewController: UIViewController{
    init(){
        super.init(nibName: nil, bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
