//
//  AllRecipesTV.swift
//  recipes
//
//  Created by Linda adel on 7/28/21.
//

import Foundation
import UIKit
import SDWebImage

extension AllRecipesViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "recipeDetails") as! RecipeDetailsViewController
        detailsVC.recipeTitle = recipesAPIList[indexPath.row].label
        detailsVC.recipeImage = recipesAPIList[indexPath.row].image
        detailsVC.recipeIngredients = recipesAPIList[indexPath.row].ingredientLines?.joined(separator: "\n")
        detailsVC.recipeWebsiteLink = recipesAPIList[indexPath.row].url
        detailsVC.modalPresentationStyle = .fullScreen
        self.present(detailsVC, animated: true, completion: nil)
    }
}
extension AllRecipesViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipesAPIList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipesList.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipesTableViewCell
        cell.layer.cornerRadius = 30
        cell.cellBackgroundView.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        cell.recipeHealthLabels.isEditable = false
        if let recipeImage = recipesAPIList[indexPath.row].image {
            cell.recipeImage.sd_setImage(with: URL(string: recipeImage))}
        if let recipeName = recipesAPIList[indexPath.row].label {
            cell.recipeName.text = recipeName}
        if let recipeSource = recipesAPIList[indexPath.row].source {
            cell.recipeSource.text = "From : \(recipeSource)"}
        if let recipeHealthLabels = recipesAPIList[indexPath.row].healthLabels {
            cell.recipeHealthLabels.text = recipeHealthLabels.joined(separator: "\n")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 260
        
      }
 
        
    
}
extension AllRecipesViewController : UISearchResultsUpdating {
   
    func updateSearchResults(for searchController: UISearchController) {
        let searchBarRecipe = searchController.searchBar.text
        
    }
    
    
}
