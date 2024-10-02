//
//  Resturant.swift
//  Snoonu
//
//  Created by Ahmed Fathi on 23/09/2024.
//

import Foundation

struct Resturant: Codable {
    var meals: [Meals]
}

struct Meals: Codable, Hashable, Identifiable {
    let id = UUID().uuidString
    var mealName: String
    var mealImage: String
    
    enum CodingKeys: String, CodingKey {
        case mealName = "strMeal"
        case mealImage = "strMealThumb"
    }
}



