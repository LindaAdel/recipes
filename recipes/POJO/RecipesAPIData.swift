//
//  RecipesAPIData.swift
//  recipes
//
//  Created by Linda adel on 7/28/21.
//

import Foundation

struct RecipesAPIData: Codable {
    let q : String?
    let from : Int?
    let to : Int?
    let more : Bool?
    let count : Double?
    let hits : [HitRecipe]?
   //let hits : [recipe]?
}
struct HitRecipe :Codable {
    
    let recipe : recipe?
}
struct recipe: Codable {
    
    let uri : String?
    let label : String?
    let image : String?
    let source : String?
    let url : String?
    let shareAs : String?
    let yield : Float?
    let dietLabels : [String]?
    let healthLabels : [String]?
    let ingredientLines : [String]?
}

