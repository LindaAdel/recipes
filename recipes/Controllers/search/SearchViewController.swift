//
//  SearchViewController.swift
//  recipes
//
//  Created by Linda adel on 7/29/21.
//

import UIKit
import TagListView
import CoreData
import DropDown

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tagListView: TagListView!
  //  @IBOutlet weak var filterRecipesContainer: UIView!
    
    @IBOutlet weak var searchList: UITableView!
    
    var searchController : UISearchController? = nil
    var searchArray = [NSManagedObject]()
    var recipesViewModel = RecipesViewModel()
    var searchHistoryModel = SearchHistoryModel()
    var recipeSearchList : [recipe] = [recipe]()
    let searchDropDown = DropDown()
 
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //search
        searchBar.delegate = self
        searchHistoryModel.restoreHistory(searchString:  getSearch())
        //table view
        searchList.delegate = self
        searchList.dataSource = self
       //listView
        tagListView.delegate = self
        setUpTagListView()
 
        recipesViewModel.bindRecipesViewModelToView = {
        
            self.onSuccessUpdateView()
            
        }
        
        recipesViewModel.bindViewModelErrorToView = {
                    
            self.onFailUpdateView()
            
        }
        recipesViewModel.fetchRecipesDataFromAPI()
       
        
        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.saveSearch(search: searchHistoryModel.searchArray)
    }
    func onSuccessUpdateView(){
        recipeSearchList  = recipesViewModel.recipesData
        searchList.reloadData()
       
        
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
