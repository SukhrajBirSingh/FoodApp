//
//  Dish.swift
//  FoodApp
//
//  Created by Admin on 2022-02-14.
//

import Foundation
struct Dish {
    let id, name, description, image : String?
    let calories: Int?
    
    var formattedCalories : String {
        return "\(calories ?? 0) calories"
    }
}
