//
//  LazyImageView.swift
//  NASA-APOD
//
//  Created by Apple on 24/09/22.
//

import Foundation
import UIKit

protocol LazyImageViewDelegate: AnyObject{
    func userTapAction()
}

/**
    This custom view used to show image from imageUrl.
    It will fetch Image from provided url asynchronously
 */
class LazyImageView: UIView{
    
    let nibName = "LazyImageView"
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet private weak var loader: UIActivityIndicatorView!
    
    weak var delegate: LazyImageViewDelegate?
    
    //MARK: - Life cycle methods
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.configureTapGesture()
        self.addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    /**
        Here we addes tap gesture on image view.
        Tapgesture will call tapGestureAction function on user interaction.
     */
    private func configureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
        self.imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGestureAction(sender: UITapGestureRecognizer){
        print("Gesture selected")
        self.delegate?.userTapAction()
    }
    
    /**
        This function fetches image from imageUrlStr Url.
        It fetched data in async mode and load image on main thread.
     */
    func loadImage(from imageUrlStr: String, placeholderImage: String){
        self.imageView.image = nil
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

