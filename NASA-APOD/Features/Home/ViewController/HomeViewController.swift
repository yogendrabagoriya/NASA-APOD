//
//  ViewController.swift
//  NASA-APOD
//
//  Created by Apple on 21/09/22.
//

import UIKit

protocol HomeVCViewModelProtocol{
    func fetchPictureOfDay(queryParam: [String: String])
}

class HomeViewController: NibViewController {

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var spodIV: UIImageView!
    @IBOutlet private weak var dateL: UILabel!
    @IBOutlet private weak var explanationTV: UITextView!
    @IBOutlet private weak var titileL: UILabel!
    @IBOutlet private weak var datePicker: UIDatePicker!
    
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
        
        datePicker.maximumDate = Date()
        
        self.showLoading()
        self.viewModel?.fetchPictureOfDay(queryParam: [:])
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
    
    // Navigation related methods
    
    private func addNavigationButton(){

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonTapAction))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(bookmarkButtonTapAction))
    }
    
    @objc private func searchButtonTapAction(){
        
    }
    
    @objc private func bookmarkButtonTapAction(){
        
    }
    
    @IBAction func datePickerAction(sender: UIDatePicker){
        print(sender.date)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // this is "2022-08-22"

        let dateStr = dateFormatter.string(from: sender.date)
        
        self.viewModel?.fetchPictureOfDay(queryParam: ["date" : dateStr])
    }
}

extension HomeViewController: HomeVCPresenter{
    func apodHandler(apod: Apod){
        self.apod = apod

        main.async {
            self.hideLoading()
            self.loadUI(by: apod)
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
