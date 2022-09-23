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

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var spodIV: UIImageView!
    @IBOutlet private weak var dateL: UILabel!
    @IBOutlet private weak var explanationTV: UITextView!
    @IBOutlet private weak var titileL: UILabel!
    
    private var apod: Apod?
    private var viewModel: HomeVCViewModelProtocol?
    
    //MARK: - Life cycle methods
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
        navigationItem.title = "APOD"
        self.showLoading()
        self.viewModel?.fetchPictureOfDay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addNavigationButton()
    }
    
    //MARK: - Private methods
    
    private func loadUI(by apod: Apod){
        self.titileL.text = apod.title
        self.dateL.text = apod.date
        self.explanationTV.text = apod.explanation
    }
    
    private func addNavigationButton(){

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonTapAction))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(bookmarkButtonTapAction))
    }
    
    @objc private func searchButtonTapAction(){
        
    }
    
    @objc private func bookmarkButtonTapAction(){
        
    }
}


extension HomeViewController: HomeVCPresenter{
    func apodHandler(apod: Apod){
        self.apod = apod

        main.async {
            self.hideLoading()
            self.loadUI(by: apod)
//            self.explanationTV.setNeedsLayout()
//            self.scrollView.setNeedsLayout()
        }
    }
    
    func failureHandler(info: AlertInfo) {
        main.async {
            self.hideLoading()
            self.showAlert(alertInfo: info)
        }
    }
}

extension HomeViewController: LoadingBehavior, AlertBehavior{}
