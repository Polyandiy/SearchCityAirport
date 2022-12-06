//
//  SearchCityCoordinator.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import Foundation
import UIKit

class SearchCityCoordinator: BaseCoordinator {
    
    private let navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    override func start() {
        let service = AirportApiService.shared
        let view = SearchCityViewController.instantiate()
        view.viewModelBuilder = {
            SearchCityViewModel(input: $0, airportService: service)
        }
        navigationController?.pushViewController(view, animated: true)
    }
}
