//
//  BaseCoordinator.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import Foundation

class BaseCoordinator: CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] = []
    var isCompleted: (() -> ())?
    
    func start() {
        fatalError("Children should implemented 'start'.")
    }
    
    
}

