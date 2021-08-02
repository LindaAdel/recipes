//
//  Url.swift
//  recipes
//
//  Created by Linda adel on 7/27/21.
//

import Foundation

struct Url {
    
    public static var AllRecipesAPI : String =
        "https://api.edamam.com/search?q=chicken&app_id=c5e90f73&app_key=%205526d1e08285d64b28bd27fa9771b254"
    public static func getFilterRecipesAPI(filterKey : String) -> String {
       let filterURL = "https://api.edamam.com/search?q=chicken&app_id=c5e90f73&app_key=5526d1e08285d64b28bd27fa9771b254&health=\(filterKey)"
        return filterURL
       
    }
}
