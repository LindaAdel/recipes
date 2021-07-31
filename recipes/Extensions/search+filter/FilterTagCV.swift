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
          // tagView.isSelected = !tagView.isSelected
        switch tagListView.tag {
        case 0 :
            let allRecipesVC = self.storyboard?.instantiateViewController(withIdentifier: "AllRecipesVC") as! AllRecipesViewController
            allRecipesVC.modalPresentationStyle = .fullScreen
            self.present(allRecipesVC, animated: true, completion: nil)
        case 1 :
            print("from case all")
        case 2 :
            print("from case all")
        case 3 :
            print("from case all")
        default:
            break
        }
       }
}
