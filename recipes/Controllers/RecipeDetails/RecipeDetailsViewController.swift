//
//  RecipeDetailsViewController.swift
//  recipes
//
//  Created by Linda adel on 7/29/21.
//

import UIKit
import SDWebImage
import Alamofire

class RecipeDetailsViewController: UIViewController {

    @IBOutlet weak var recipeDetailImage: UIImageView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var recipeIngredientsLines: UITextView!
    
    var recipeTitle : String!
    var recipeImage : String!
    var recipeIngredients : String!
    var recipeWebsiteLink : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        self.setUpViewData()
        // Do any additional setup after loading the view.
    }
    
    func setUpViewData(){
        
        navigationBar.topItem?.title = recipeTitle
        recipeDetailImage.sd_setImage(with: URL(string: recipeImage))
        recipeIngredientsLines.text = recipeIngredients
    }
    
    @IBAction func shareRecipeLink(_ sender: Any) {
        print("share")
    }
    
   
    @IBAction func backToList(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToRecipeWebsiteBtn(_ sender: Any) {
        UIApplication.shared.open(URL(string: recipeWebsiteLink)!, options: [:], completionHandler: nil)
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
