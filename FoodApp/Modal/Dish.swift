//
//  Dish.swift
//  FoodApp
//
//  Created by Admin on 2022-02-14.
//

import Foundation
struct Dish: Codable {
    let id, name, description, image : String?
    let calories: Int?
    var fav : Bool? = false
    
    var formattedCalories : String {
        return "\(calories ?? 0) calories"
    }
}
