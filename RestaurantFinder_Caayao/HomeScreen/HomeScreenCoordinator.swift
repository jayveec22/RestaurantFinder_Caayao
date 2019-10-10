//
//  HomeScreenCoordinator.swift
//  RestaurantFinder_Caayao
//
//  Created by Jayvee Caayao on 09.10.19.
//  Copyright © 2019 Jayvee Caayao. All rights reserved.
//

import Kio

public final class HomeScreenCoordinator: AbstractCoordinator {

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }

    private let navigationController: UINavigationController

    public override func start() {
        let vc: HomeScreenVC = HomeScreenVC(delegate: self)
        self.navigationController.pushViewController(vc, animated: true)
    }
}

extension HomeScreenCoordinator: HomeScreenVCDelegate {
    public func openRestaurantDetail(restaurant: Venue) {
        let coordinator: RestaurantDetailsCoordinator = RestaurantDetailsCoordinator(navigationController: self.navigationController, restaurant: restaurant)
        coordinator.start()
    }


}
