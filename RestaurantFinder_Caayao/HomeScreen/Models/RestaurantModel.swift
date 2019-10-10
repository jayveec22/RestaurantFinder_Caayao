//
//  RestaurantModel.swift
//  RestaurantFinder_Caayao
//
//  Created by Jayvee Caayao on 10.10.19.
//  Copyright © 2019 Jayvee Caayao. All rights reserved.
//

import Foundation

public struct RestaurantResponse: Decodable {
    let venues: [Venue]

    public enum CodingKeys: String, CodingKey {
        case venues
    }
}

public struct Venue: Decodable {
    let id: String
    let name: String
    let location: Location
    let categories: [Categories]
    let referralId: String
    let hasPerk: Bool

    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case location
        case categories
        case referralId
        case hasPerk
    }
}

public struct Location: Decodable {
    let address: String
    let lat: Double
    let lng: Double
    let distance: Int

    public enum CodingKeys: String, CodingKey {
        case address
        case lat
        case lng
        case distance
    }
}

public struct Categories: Decodable {
    let id: String
    let name: String
    let icon: Icon
    let pluralName: String

    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case icon
        case pluralName
    }
}

public struct Icon: Decodable {
    let prefix: String
    let suffix: String

    public enum Codingkeys: String, CodingKey {
        case prefix
        case suffix
    }
}

public struct RestaurantModel: Decodable {
    public enum CodingKeys: String, CodingKey {
        case response
    }

    public init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<RestaurantModel.CodingKeys> = try decoder.container(keyedBy: RestaurantModel.CodingKeys.self)
        self.response = try container.decode(RestaurantResponse.self, forKey: RestaurantModel.CodingKeys.response)
    }

    public let response: RestaurantResponse
}
