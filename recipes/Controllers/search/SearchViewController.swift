//
//  SearchViewController.swift
//  recipes
//
//  Created by Linda adel on 7/29/21.
//

import UIKit
import TagListView

class SearchViewController: UIViewController {
    
    @IBOutlet weak var tagListView: TagListView!
    
    
    @IBOutlet weak var filterRecipesContainer: UIView!
    
    var searchController : UISearchController? = nil
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //search
        showSearchBar()
       //listView
        tagListView.delegate = self
        setUpTagListView()
       
        
        // Do any additional setup after loading the view.
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
