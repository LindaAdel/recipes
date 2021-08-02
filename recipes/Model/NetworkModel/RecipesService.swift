//
//  RecipesService.swift
//  recipes
//
//  Created by Linda adel on 7/27/21.
//

import Foundation
import Alamofire

class RecipesService {
    
    var recipesArray = [recipe]()
   
    func fetchRecipesData(completion : @escaping ([recipe]?, Error?)->()){

        AF.request(Url.AllRecipesAPI)
            .validate()

            .responseDecodable(of: RecipesAPIData.self) { (response) in
                switch response.result {
          
                case .success( _):

                    guard let recipesAPIData = response.value else { return }
                   
                    for item in recipesAPIData.hits!{
                      
                        self.recipesArray.append(item.recipe!)
                           
                    }
                    
                    completion(self.recipesArray,nil)
                    
               
                case .failure(let error):

                    completion(nil , error)


                }
            }
    }
    func fetchFilterdRecipesData(filterKey : String ,completion : @escaping ([recipe]?, Error?)->()){
        switch filterKey {
        case "vegan":
            AF.request(Url.getFilterRecipesAPI(filterKey: filterKey))
                .validate()

                .responseDecodable(of: RecipesAPIData.self) { (response) in
                    switch response.result {
              
                    case .success( _):

                        guard let recipesAPIData = response.value else { return }
                       
                        for item in recipesAPIData.hits!{
                          
                            self.recipesArray.append(item.recipe!)
                               
                        }
                        
                        completion(self.recipesArray,nil)
                        
                   
                    case .failure(let error):

                        completion(nil , error)


                    }
                }
        case "keto-friendly" :
            AF.request(Url.getFilterRecipesAPI(filterKey: filterKey))
                .validate()

                .responseDecodable(of: RecipesAPIData.self) { (response) in
                    switch response.result {
              
                    case .success( _):

                        guard let recipesAPIData = response.value else { return }
                       
                        for item in recipesAPIData.hits!{
                          
                            self.recipesArray.append(item.recipe!)
                               
                        }
                        
                        completion(self.recipesArray,nil)
                        
                   
                    case .failure(let error):

                        completion(nil , error)


                    }
                }
        case "low-sugar" :
            AF.request(Url.getFilterRecipesAPI(filterKey: filterKey))
                .validate()

                .responseDecodable(of: RecipesAPIData.self) { (response) in
                    switch response.result {
              
                    case .success( _):

                        guard let recipesAPIData = response.value else { return }
                       
                        for item in recipesAPIData.hits!{
                          
                            self.recipesArray.append(item.recipe!)
                               
                        }
                        
                        completion(self.recipesArray,nil)
                        
                   
                    case .failure(let error):

                        completion(nil , error)


                    }
                }
        default:
            break
        }
        
    }
}
