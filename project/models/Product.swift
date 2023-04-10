//
//  Product.swift
//  project
//
//  Created by dan on 05.04.2023.
//

import Foundation


class Product: Decodable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
    let quantity: Int?
    
    class Rating: Decodable {
        let rate: Double
        let count: Int
    }

}

