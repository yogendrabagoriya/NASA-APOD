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
    @IBOutlet private weak var spodIV: LazyImageView!
    @IBOutlet private weak var dateL: UILabel!
    @IBOutlet private weak var explanationTV: UITextView!
    @IBOutlet private weak var titileL: UILabel!
    @IBOutlet private weak var datePicker: UIDatePicker!
    
    private var selectedDate: Date?
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
        
        self.spodIV.delegate = self
        datePicker.maximumDate = Date()
        
        // Fetching today's SPOD from server.
        self.showLoading()
        self.viewModel?.fetchPictureOfDay(queryParam: [:])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureNavigation()
    }
    
    //MARK: - Private methods
    
    private func loadUI(by apod: Apod){
        self.titileL.text = apod.title
        self.dateL.text = apod.date
        self.explanationTV.text = apod.explanation
    }
    
    // Navigation related methods
    private func configureNavigation(){
        navigationItem.title = "APOD"
        navigationController?.navigationBar.backgroundColor = .systemGray5
    }
    
    @IBAction func datePickerAction(sender: UIDatePicker){
        print(sender.date)
        if selectedDate != sender.date{
            selectedDate = sender.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd" // this is "2022-08-22"
            
            let dateStr = dateFormatter.string(from: sender.date)
            self.showLoading()
            self.viewModel?.fetchPictureOfDay(queryParam: ["date" : dateStr])
        }
    }
}

extension HomeViewController: LazyImageViewDelegate{
    func userTapAction() {
        if let imageUrl = self.apod?.hdurl{
            // Open Image in Large View with HD defination.
            let vc = ImageVCComposer.makeImageViewController(imageUrlStr: imageUrl)
            let navController = UINavigationController(rootViewController: vc)
            self.present(navController, animated: true)
        }
    }
}

extension HomeViewController: HomeVCPresenter{
    func apodHandler(apod: Apod){
        self.apod = apod

        main.async {
            self.hideLoading()
            self.loadUI(by: apod)
            self.spodIV.loadImage(from: apod.url, placeholderImage: "nasa")
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
