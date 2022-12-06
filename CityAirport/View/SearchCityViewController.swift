//
//  ViewController.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import UIKit
import RxSwift
import RxDataSources

class SearchCityViewController: UIViewController, Storyboardable {

    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: SearchCityVMProtocol!
    var viewModelBuilder: SearchCityVMProtocol.ViewModelBuilder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = viewModelBuilder((
            searchText: searchTextField.rx.text.orEmpty.asDriver(), ()
        ))
        self.title = "Airports"
    }


}

