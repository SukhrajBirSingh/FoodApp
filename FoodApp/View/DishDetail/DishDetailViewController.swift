//
//  DishDetailViewController.swift
//  FoodApp
//
//  Created by Admin on 2022-02-15.
//

import UIKit

class DishDetailViewController: UIViewController {

    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    
    
    @IBAction func placeOrderButtonPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
