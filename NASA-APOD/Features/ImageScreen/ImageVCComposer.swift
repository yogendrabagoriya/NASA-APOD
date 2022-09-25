//
//  ImageVCComposer.swift
//  NASA-APOD
//
//  Created by Apple on 25/09/22.
//

import Foundation
import UIKit

struct ImageVCComposer{
    static func makeImageViewController(imageUrlStr: String) -> (UIViewController){
        
        let vc = ImageViewController(imageUrlStr: imageUrlStr)
        return vc
    }
}
