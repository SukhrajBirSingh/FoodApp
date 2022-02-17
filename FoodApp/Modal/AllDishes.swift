//
//  AllDishes.swift
//  FoodApp
//
//  Created by Admin on 2022-02-16.
//

import Foundation

struct AllDishes: Codable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials : [Dish]?
}
