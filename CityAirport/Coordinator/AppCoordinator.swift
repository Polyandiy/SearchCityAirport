//
//  AppCoordinator.swift
//  CityAirport
//
//  Created by Поляндий on 06.12.2022.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator {
    private let window: UIWindow
    
    private var navigationController: UINavigationController = {
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
        let searchCityCoordinator = SearchCityCoordinator(navigationController: navigationController)
        self.add(coordinator: searchCityCoordinator)
        searchCityCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
