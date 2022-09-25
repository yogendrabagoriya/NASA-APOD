//
//  ImageViewController.swift
//  NASA-APOD
//
//  Created by Apple on 25/09/22.
//

import Foundation
import UIKit

/**
    This class is used to handle HD image.
    This Loades image from specific image url.
 */
class ImageViewController: NibViewController{
    
    @IBOutlet private weak var imageView: LazyImageView!
    
    private var imageUrlStr: String
    
    //MARK: - Life cycle methods
    init(imageUrlStr: String){
        self.imageUrlStr = imageUrlStr
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigation()
        self.imageView.loadImage(from: imageUrlStr, placeholderImage: "nasa")
    }
    
    //MARK: - Priavte methods
    private func configureNavigation(){
        navigationController?.navigationBar.backgroundColor = .systemGray5
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapAction))
    }
    
    @objc private func doneButtonTapAction(){
        self.dismiss(animated: true)
    }
}
