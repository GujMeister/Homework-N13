//
//  File.swift
//  Auto Layout Engine
//
//  Created by Luka Gujejiani on 05.04.24.
//

import Foundation

struct Coffee {
    var productName: String
    var totalNumberOfReviews: Int
    var averageStarCount: Double
    var prices: Prices
    var description: Description
    var withWhat: String
    
    struct Description {
        var small: String
        var medium: String
        var large: String
    }
    struct Prices {
        var small: Double
        var medium: Double
        var large: Double
    }
}


var cappuccino = Coffee(productName: "კაპუჩინო",
                        totalNumberOfReviews: 230,
                        averageStarCount: 4.8,
                        prices: Coffee.Prices(
                            small: 4.53,
                            medium: 5.89,
                            large: 8.18),
                        description: Coffee.Description(
                            small: "მოცემული კაპუჩინო არის დაახლოებით 150 მლ. ის შეიცავს 25 მლ. ესპრესოს ყავას, 85 მლ. ახალთახალი მოწველილი ძროხის რძის რძეს, რომელიც სპეც...",
                            medium: "მოცემული კაპუჩინო არის დაახლოებით 225 მლ. ის შეიცავს 40 მლ. ესპრესოს ყავას, 100 მლ. ახალთახალი მოწველილი ძროხის რძის რძეს, რომელიც სპეც...",
                            large: "მოცემული კაპუჩინო არის დაახლოებით 350 მლ. ის შეიცავს 55 მლ. ესპრესოს ყავას, 150 მლ. ახალთახალი მოწველილი ძროხის რძის რძეს, რომელიც სპეც..."), 
                        withWhat: "შოკოლადით")
