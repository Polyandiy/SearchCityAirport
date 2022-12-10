//
//  AppCoordinator.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import Foundation
import UIKit

/// parent coordinator, starts window launching app
class AppCoordinator: BaseCoordinator {
    
    private let window: UIWindow
    private let navigationController: UINavigationController = {
        let nav = UINavigationController()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemIndigo
                
        let titleAttribute = [NSAttributedString.Key.font:  UIFont(name: "Avenir-Medium", size: 34)!, NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = titleAttribute
        
        nav.navigationBar.standardAppearance = appearance
        nav.navigationBar.scrollEdgeAppearance = appearance
        return nav
    }()

    init(window: UIWindow) {
        self.window = window
    }

    override func start() {
        // make router constant
        let router = Router(navigationController: self.navigationController)
        // dependency inject to a first ViewController
        let seacrhCityCoordinator = SearchCityCoordinator(router: router)
        self.add(coordinator: seacrhCityCoordinator)
        // remove coordinator after popViewcontroller
        // this won't be happen but just in case to be safe...
        seacrhCityCoordinator.isCompleted = { [weak self, weak seacrhCityCoordinator] in
            guard let coordinator = seacrhCityCoordinator else {
                return
            }
            self?.remove(coordinator: coordinator)
        }

        // instantiate view
        seacrhCityCoordinator.start()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
