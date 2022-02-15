//
//  StringExtension.swift
//  FoodApp
//
//  Created by Admin on 2022-02-14.
//

import Foundation

extension String {
    var asUrl : URL? {
        return URL(string: self)
    }
}
