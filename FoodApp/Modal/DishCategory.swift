//
//  DishCategory.swift
//  FoodApp
//
//  Created by Admin on 2022-02-14.
//

import Foundation

struct DishCategory : Codable {
    let id, name, image : String?
    
    enum CodingKeys : String , CodingKey{
        case id
        case name = "title"
        case image
    }
}
