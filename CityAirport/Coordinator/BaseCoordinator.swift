//
//  BaseCoordinator.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import Foundation

class BaseCoordinator: Coordinator {

    var childCoordinator: [Coordinator] = []
    var isCompleted: (() -> ())?
    
    func start() {
        fatalError("Child coordinator should implement 'start' function.")
    }
}

