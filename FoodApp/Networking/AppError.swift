//
//  AppError.swift
//  FoodApp
//
//  Created by Admin on 2022-02-16.
//

import Foundation

enum AppError : LocalizedError{
    case errorDecoding
    case unkonwnError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String?{
        switch self{
            
    
        case .errorDecoding:
            return "Response could not be decoded"
        case .unkonwnError:
            return "unknown error"
        case .invalidUrl:
            return "Please give a valid URL"
        case .serverError(let error):
            return error
        }
        
    }
}
