//
//  HomeScreenVCDelegate.swift
//  RestaurantFinder_Caayao
//
//  Created by Jayvee Caayao on 09.10.19.
//  Copyright © 2019 Jayvee Caayao. All rights reserved.
//

import Kio

public protocol HomeScreenVCDelegate: class {
    func openRestaurantDetail(restaurant: Venue)
}
