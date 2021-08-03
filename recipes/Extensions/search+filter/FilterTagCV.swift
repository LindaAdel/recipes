//
//  FilterTagCV.swift
//  recipes
//
//  Created by Linda adel on 7/30/21.
//

import Foundation
import UIKit
import TagListView



extension SearchViewController : TagListViewDelegate {
    
    func setUpTagListView() {
        
        tagListView.alignment = .center
        tagListView.textFont = .systemFont(ofSize:20)
        tagListView.addTag("All")
        tagListView.addTag("Vegan")
        tagListView.addTag("Keto")
        tagListView.addTag("Low Sugar")
    }
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag pressed: \(title), \(sender)")
        
        switch title {
        case "All" :
            let allRecipesVC = self.storyboard?.instantiateViewController(withIdentifier: "AllRecipesVC") as! AllRecipesViewController
            allRecipesVC.filterTag = "All"
            allRecipesVC.modalPresentationStyle = .fullScreen
            self.present(allRecipesVC, animated: true, completion: nil)
            
        case "Vegan" :
            let allRecipesVC =  self.storyboard?.instantiateViewController(withIdentifier: "AllRecipesVC") as! AllRecipesViewController
            allRecipesVC.filterTag = "vegan"
            allRecipesVC.modalPresentationStyle = .fullScreen
            self.present(allRecipesVC, animated: true, completion: nil)
        case "Keto" :
            let allRecipesVC =  self.storyboard?.instantiateViewController(withIdentifier: "AllRecipesVC") as! AllRecipesViewController
            allRecipesVC.filterTag = "keto-friendly"
            allRecipesVC.modalPresentationStyle = .fullScreen
            self.present(allRecipesVC, animated: true, completion: nil)
        case "Low Sugar" :
            let allRecipesVC =  self.storyboard?.instantiateViewController(withIdentifier: "AllRecipesVC") as! AllRecipesViewController
            allRecipesVC.filterTag = "low-sugar"
            allRecipesVC.modalPresentationStyle = .fullScreen
            self.present(allRecipesVC, animated: true, completion: nil)
        default:
            break
        }
    }
}
