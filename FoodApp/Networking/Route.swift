//
//  Route.swift
//  FoodApp
//
//  Created by Admin on 2022-02-16.
//

import Foundation

enum Route {
    static let baseUrl = "https://yummie.glitch.me"
    
    case fetchAllCategories
    case placeOrder(String)
    
    var description : String {
        switch self {
            
        case .fetchAllCategories:
            return "/dish-categories"
            
        case .placeOrder(let dishId):
            return "/orders/\(dishId)"
        }
    }
}
