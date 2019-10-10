//
//  HomeScreenVC.swift
//  RestaurantFinder_Caayao
//
//  Created by Jayvee Caayao on 09.10.19.
//  Copyright © 2019 Jayvee Caayao. All rights reserved.
//

import Kio

public class HomeScreenVC: KioViewController {

    private weak var delegate: HomeScreenVCDelegate?

    public init(delegate: HomeScreenVCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(RestaurantCell.self, forCellReuseIdentifier: RestaurantCell.identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        self.view = HomeScreenView()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        FourSquareAPIService.getRestaurantsNearMe(completion: { restaurants in
            self.restaurants = restaurants
            self.sortedRestaurants = restaurants.response.venues.sorted(by: { $0.location.distance < $1.location.distance })
            self.tableView.reloadData()
        })
    }
    public override func viewDidLoad() {
        super.viewDidLoad()
    }

    public var restaurants: RestaurantModel?
    public var sortedRestaurants: [Venue]?
}

extension HomeScreenVC {
    unowned var rootView: HomeScreenView { return self.view as! HomeScreenView }
    unowned var tableView: UITableView { return self.rootView.tableView }
}

extension HomeScreenVC: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 73.0
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let delegate = self.delegate,
            let restaurants = self.sortedRestaurants
        else {
            return
        }

        delegate.openRestaurantDetail(restaurant: restaurants[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension HomeScreenVC: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let restaurants = self.sortedRestaurants else { return 0 }
        return restaurants.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
            withIdentifier: RestaurantCell.identifier
            ) as? RestaurantCell,
            let restaurants = self.sortedRestaurants
        else {
            return UITableViewCell()
        }
        cell.titleLabel.text = restaurants[indexPath.row].name
        cell.distanceLabel.text = "\(restaurants[indexPath.row].location.distance)m away"
        return cell
    }
}
