//
//  SearchBarMethods.swift
//  recipes
//
//  Created by Linda adel on 7/30/21.
//

import Foundation
import UIKit

extension SearchViewController {
    
    //add search bar to the view
        func showSearchBar()  {
            //search
            let searchItemsVC = storyboard!.instantiateViewController(withIdentifier: "AllRecipesVC") as! AllRecipesViewController
            //to display search results in location search table view
            searchController = UISearchController(searchResultsController: searchItemsVC)
            searchController?.searchResultsUpdater = searchItemsVC as? UISearchResultsUpdating
            
            //configures the search bar, and embeds it within the navigation bar
            let searchBar = searchController?.searchBar
            searchBar?.placeholder = "Search for Recipes"
            searchController?.hidesNavigationBarDuringPresentation = false
            navigationItem.hidesSearchBarWhenScrolling = false
            
            navigationItem.titleView = searchBar
            
            searchController?.obscuresBackgroundDuringPresentation = true
            definesPresentationContext = true
            
            //change cancel button color
            UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = UIColor.init(red: 244/255, green: 199/255, blue: 18/255, alpha: 1)
            
        }
    
}
