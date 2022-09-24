//
//  LazyImageView.swift
//  NASA-APOD
//
//  Created by Apple on 24/09/22.
//

import Foundation
import UIKit

class LazyImageView: UIView{
    
//    var contentView:UIView?
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var loader: UIActivityIndicatorView!
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
//        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "LazyImageView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func loadImage(from imageUrlStr: String, placeholderImage: String){
        
        guard let imageUrl = URL(string: imageUrlStr) else {
            return
        }
        
        loader.startAnimating()
        
        global.async {[weak self] in
            if let data = try? Data(contentsOf: imageUrl){
                if let image = UIImage(data: data){
                    main.async {
                        self?.loader.stopAnimating()
                        self?.imageView.image = image
                    }
                }
            }
        }
    }
}

