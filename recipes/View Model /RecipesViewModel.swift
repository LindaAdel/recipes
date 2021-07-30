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
        self.fetchRecipesDataFromAPI()
        
       
    }
    func fetchRecipesDataFromAPI (){
        
        recipesService.fetchRecipesData(completion: { (recipesData , error) in
       
            if let error : Error = error{
                
                let message = error.localizedDescription
                self.showError = message
                
            }else{
                
                self.recipesData = recipesData
                
            }
        })
    }
    
}
