//
//  RestaurantDetailsCoordinator.swift
//  RestaurantFinder_Caayao
//
//  Created by Jayvee Caayao on 10.10.19.
//  Copyright © 2019 Jayvee Caayao. All rights reserved.
//

import Foundation
import Kio

public class RestaurantDetailsCoordinator: AbstractCoordinator {

    public init(navigationController: UINavigationController, restaurant: Venue)
    {
        self.navigationController = navigationController
        self.restaurant = restaurant
    }

    public override func start() {
        let vc: RestaurantDetailsVC = RestaurantDetailsVC(restaurant: self.restaurant)
        self.navigationController.pushViewController(vc, animated: true)
        
    }

    public let navigationController: UINavigationController
    public let restaurant: Venue
}
