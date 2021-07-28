//
//  RecipesService.swift
//  recipes
//
//  Created by Linda adel on 7/27/21.
//

import Foundation
import Alamofire

class RecipesService {
   
    func fetchItemsData<T:Codable>(of:T.Type,url:String,completion : @escaping (T?, Error?)->()){

        AF.request(url)
                .validate()
            .responseDecodable(of: T.self) { (response) in
                    switch response.result {
                    case .success( _):
                       if let items = response.value {
                        completion(items,nil)

                       }

                    case .failure(let error):
                        print(error)
                        completion(nil , error)
        
        
                    }
                }
    }
}
