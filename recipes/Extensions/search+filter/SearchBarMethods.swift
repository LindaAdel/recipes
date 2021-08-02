//
//  SearchBarMethods.swift
//  recipes
//
//  Created by Linda adel on 7/30/21.
//

import Foundation
import UIKit
import CoreData
import DropDown


    extension SearchViewController : UITableViewDelegate{
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "recipeDetails") as! RecipeDetailsViewController
            detailsVC.recipeTitle = recipeSearchList[indexPath.row].label
            detailsVC.recipeImage = recipeSearchList[indexPath.row].image
            detailsVC.recipeIngredients = recipeSearchList[indexPath.row].ingredientLines?.joined(separator: "\n")
            detailsVC.recipeWebsiteLink = recipeSearchList[indexPath.row].url
            detailsVC.modalPresentationStyle = .fullScreen
            self.present(detailsVC, animated: true, completion: nil)
        }
    }
    extension SearchViewController : UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            recipeSearchList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = searchList.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipesTableViewCell
            cell.layer.cornerRadius = 30
            cell.cellBackgroundView.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
            cell.recipeHealthLabels.isEditable = false
            if let recipeImage = recipeSearchList[indexPath.row].image {
                cell.recipeImage.sd_setImage(with: URL(string: recipeImage))}
            if let recipeName = recipeSearchList[indexPath.row].label {
                cell.recipeName.text = recipeName}
            if let recipeSource = recipeSearchList[indexPath.row].source {
                cell.recipeSource.text = "From : \(recipeSource)"}
            if let recipeHealthLabels = recipeSearchList[indexPath.row].healthLabels {
                cell.recipeHealthLabels.text = recipeHealthLabels.joined(separator: "\n")
            }
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
              return 260
            
          }
    }
        // MARK: searchbar methodes
  
    extension SearchViewController : UISearchBarDelegate{
        func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
            // change cancel button color
         UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = UIColor.init(red: 244/255, green: 199/255, blue: 18/255, alpha: 1)
            return true
        }
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
                self.searchBar.showsCancelButton = true
         
        }
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
                searchBar.showsCancelButton = false
                searchBar.text = ""
                searchBar.resignFirstResponder()
        }
        // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchText = searchBar.text!
        searchDropDown.anchorView = searchList
        searchDropDown.dataSource = ["all","kdk"]
        searchDropDown.show()
        recipeSearchList = recipesViewModel.searchFiltring(searchText: searchText , recipesData: recipeSearchList)
        searchList.reloadData()
           
       }
        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            searchList.reloadData()
        }
        
        // MARK: searchbar core data

    func storeSearch(search: String){
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Searches", in: manageContext)
        
        let searchObj = NSManagedObject(entity: entity!, insertInto: manageContext)
        searchObj.setValue(search, forKey: "search")
        
        do{
            try manageContext.save()
            searchArray.append(searchObj)
        }catch let error{
            print(error)
        }
    }
    
    func fetchSearch(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Searches")
        
        do{
            searchArray = try manageContext.fetch(fetchRequest)
        }catch let error{
            print(error)
            
        }
    }
    
    func deleteSearch(i : Int){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        manageContext.delete(searchArray[i])
        do{
            try manageContext.save()
        }catch let error{
            
            print(error)
        }
        searchArray.remove(at: i)
        searchHistoryArray.remove(at: i)
    }
    
    
}
