//
//  AllRecipesViewController.swift
//  recipes
//
//  Created by Linda adel on 7/27/21.
//

import UIKit


class AllRecipesViewController: UIViewController {


    @IBOutlet weak var recipesList: UITableView!
    
    
    var recipesAPIList : [recipe] = [recipe]()
    let recipesViewModel = RecipesViewModel()
    var filterTag : String!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipesList.delegate = self
        recipesList.dataSource = self
        // Do any additional setup after loading the view.
       
        recipesViewModel.bindRecipesViewModelToView = {
        
            self.onSuccessUpdateView()
            
        }
        
        recipesViewModel.bindViewModelErrorToView = {
                    
            self.onFailUpdateView()
            
        }
        switch filterTag {
           
        case "All" :
            recipesViewModel.fetchRecipesDataFromAPI()
        case "vegan" :
           recipesViewModel.fetchFilterdRecipesDataFromAPI(filterKey: filterTag )
        case "keto-friendly" :
            recipesViewModel.fetchFilterdRecipesDataFromAPI(filterKey: filterTag )
        case "low-sugar" :
            recipesViewModel.fetchFilterdRecipesDataFromAPI(filterKey: filterTag )
        default:
            break
        }
        
            recipesViewModel.fetchRecipesDataFromAPI()
       
    }
    
    
    
    @IBAction func backNavBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func onSuccessUpdateView(){
        recipesAPIList = recipesViewModel.recipesData
        recipesList.reloadData()
        
    }
    func onFailUpdateView(){
        let alert = UIAlertController(title: "Error", message: recipesViewModel.showError, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
            
        }
        
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
