//
//  SearchHistoryModel.swift
//  recipes
//
//  Created by Linda adel on 8/2/21.
//

import Foundation

class SearchHistoryModel{
    
    var searchArray : [String]!
    
    init() {
        searchArray = Array.init(repeating: "", count: 10)
    }
    func AddToHistory(searchString : String) {
        for item in searchArray.indices {
            if searchArray[item] == ""{
                searchArray[item] = searchString
                return
            }
        }
        searchArray.removeLast()
        searchArray.append(searchString)
    }
    func restoreHistory(searchString : [String]) {
        for item in searchString.indices {
            searchArray[item] = searchString[item]
        }
    }
}
