//
//  RecipesViewModel.swift
//  recipes
//
//  Created by Linda adel on 7/28/21.
//

import Foundation

class RecipesViewModel: NSObject {
    
    var recipesService:RecipesService!
    var recipesData : [recipe]!{
        didSet{
            self.bindRecipesViewModelToView()
        }
    }
    var allRecipesData : [recipe]!{
        didSet{
            recipesData = allRecipesData
        }
    }
    var showError : String! {
        
        didSet{
            
            self.bindViewModelErrorToView()
        }
        
    }
    var bindRecipesViewModelToView : (()->()) = {}
    var bindViewModelErrorToView : (()->()) = {}
    
    override init() {
        super.init()
        self.recipesService = RecipesService()
        
        
        
        
    }
    func fetchRecipesDataFromAPI (){
        
        recipesService.fetchRecipesData(completion: { (recipesData , error) in
            
            if let error : Error = error{
                
                let message = error.localizedDescription
                self.showError = message
                
            }else{
                
                self.allRecipesData = recipesData
                
            }
        })
    }
    func fetchFilterdRecipesDataFromAPI (filterKey : String){
        recipesService.fetchFilterdRecipesData(filterKey: filterKey, completion:{ (recipesData , error) in
            
            if let error : Error = error{
                
                let message = error.localizedDescription
                self.showError = message
                
            }else{
                
                self.recipesData = recipesData
                
            }
        } )
    }
    
    func searchFiltring(searchText : String) ->[recipe] {
        
        var filterdData : [recipe]
        filterdData = recipesData.filter { (recipesData) in
            (recipesData.label?.lowercased().contains(searchText.lowercased()))!
        }
        
        print(filterdData)
        return filterdData
    }
}
