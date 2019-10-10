//
//  FourSquareAPIService.swift
//  RestaurantFinder_Caayao
//
//  Created by Jayvee Caayao on 09.10.19.
//  Copyright © 2019 Jayvee Caayao. All rights reserved.
//

import Foundation
import Alamofire
import Pilgrim
import SwiftyJSON

class FourSquareAPIService {
    class func getRestaurantsNearMe(completion: @escaping (RestaurantModel) -> Void) {

        let url: String = "https://api.foursquare.com/v2/venues/search"
        let parameters: [String : Any] = [
            "client_id": "XKPFUBVA1Y5QIQ1BJYIL15UPOJ4ILCW31X4RC4IMOZOABOJP",
            "client_secret": "RFJPLN0ST25ZJZB5DFD5HYWFGBSX2RD1W1GNAKRWEG1ZIFJT",
            "v": "20190425",
            "ll": "14.559038, 121.024518",
            "intent": "browse",
            "radius": 10000,
            "query": "restaurant",
            "limit": 14
        ]

        Alamofire.request(
            url,
            method: HTTPMethod.get,
            parameters: parameters,
            encoding: URLEncoding.default,
            headers: nil
        ).response { response in
            guard let data = response.data else { return }
            print(data)
            do {
                guard let data = response.data else { return }
                let restaurants: RestaurantModel = try JSONDecoder().decode(RestaurantModel.self, from: data)
                completion(restaurants)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
