//
//  RestaurantDetailsVC.swift
//  RestaurantFinder_Caayao
//
//  Created by Jayvee Caayao on 10.10.19.
//  Copyright © 2019 Jayvee Caayao. All rights reserved.
//

import Foundation
import Kio

public class RestaurantDetailsVC: KioViewController {

    public init(restaurant: Venue) {
        self.restaurant = restaurant
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        self.view = RestaurantDetailsView()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        guard
            let categories: Categories = self.restaurant.categories.first,
            let url: URL = URL(string: "\(categories.icon.prefix)\(categories.icon.suffix)")
        else {
            return
        }
        self.rootView.restaurantLabel.text = self.restaurant.name
        self.rootView.pluralNameLabel.text = categories.pluralName
        self.rootView.addressLabel.text = "Address: \(self.restaurant.location.address)"
        

//        self.downloadImage(from: url)
        // IMAGE LINK IS NOT WORKING!
    }

    public func downloadImage(from url: URL) {
        self.getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.rootView.restaurantImageView.image = UIImage(data: data)
            }
        }
    }

    public func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    public let restaurant: Venue
}

extension RestaurantDetailsVC {
    unowned var rootView: RestaurantDetailsView { return self.view as! RestaurantDetailsView }
}
