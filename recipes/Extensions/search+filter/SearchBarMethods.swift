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
        searchDropDown.anchorView = tagListView
        searchDropDown.dataSource = self.searchHistoryModel.searchArray
        searchDropDown.show()
        searchDropDown.selectionAction = {  (index: Int, item: String) in
            searchBar.text = item}
        
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        
        searchBar.resignFirstResponder()
        recipesViewModel.recipesData = recipesViewModel.allRecipesData
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchText = searchBar.text!
        recipeSearchList = recipesViewModel.searchFiltring(searchText: searchText )
        searchList.reloadData()
        searchDropDown.hide()
        
        
        
        
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let searchText = searchBar.text!
        searchHistoryModel.AddToHistory(searchString: searchText)
        searchBar.text = ""
        searchList.reloadData()
    }
    
    // MARK: searchbar core data
    
    func saveSearch(search: [String]){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Searches", in: manageContext)
        for item in search {
            
            let searchObj = NSManagedObject(entity: entity!, insertInto: manageContext)
            searchObj.setValue(item, forKey: "search")
            
            do{
                try manageContext.save()
                searchArray.append(searchObj)
            }catch let error{
                print(error)
            }
        }
    }
    
    func getSearch() -> [String]{
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Searches")
        var stringArray = [String]()
        do{
            searchArray = try manageContext.fetch(fetchRequest)
            stringArray = (searchArray.map { $0.value(forKey: "search")
            } as? [String])!
            
        }catch let error{
            print(error)
            
        }
        return stringArray
    }
    
    
    
}
