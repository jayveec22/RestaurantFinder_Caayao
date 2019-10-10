//
//  AppCoordinator.swift
//  RestaurantFinder_Caayao
//
//  Created by Jayvee Caayao on 09.10.19.
//  Copyright © 2019 Jayvee Caayao. All rights reserved.
//

import Kio

public final class AppCoordinator: AbstractCoordinator {
    private unowned let navigationController: UINavigationController

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    public override func start() {
        let homeScreen = HomeScreenCoordinator(navigationController: self.navigationController)
        homeScreen.start()
        self.add(childCoordinator: homeScreen)
    }
}
