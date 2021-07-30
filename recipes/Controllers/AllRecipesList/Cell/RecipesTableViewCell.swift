//
//  RecipesTableViewCell.swift
//  recipes
//
//  Created by Linda adel on 7/28/21.
//

import UIKit

class RecipesTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var recipeHealthLabels: UITextView!
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var recipeName: UILabel!
    
    @IBOutlet weak var recipeSource: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
}
