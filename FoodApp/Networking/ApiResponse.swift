//
//  ApiResponse.swift
//  FoodApp
//
//  Created by Admin on 2022-02-16.
//

import Foundation

struct ApiResponse <T:Codable> : Codable {
    let status : Int
    let message : String?
    let data : T?
    let error : String?
    
}
