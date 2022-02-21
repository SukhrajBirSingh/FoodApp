//
//  DishDetailViewController.swift
//  FoodApp
//
//  Created by Admin on 2022-02-15.
//

import UIKit
import ProgressHUD

var favDish = [Dish]()


class DishDetailViewController: UIViewController {

    var heart : Bool = false
    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var favButton: UIButton!
   
    override func viewWillAppear(_ animated: Bool) {
        heartResult()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
        // Do any additional setup after loading the view.
    }
    
    var dish : Dish!
    
    func heartResult() {
        
        if favDish.contains(dish){
            favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            heart = true
        } else {
            favButton.setImage(UIImage(systemName: "heart"), for: .normal)
            heart = false
        }
    }

    
    @IBAction func favButtonPressed(_ sender: UIButton) {
        heart = !heart
        if heart {
            favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            favDish.append(dish)
         }else{
            favButton.setImage(UIImage(systemName: "heart"), for: .normal)
            if let index = favDish.firstIndex(of: dish)
            {favDish.remove(at: index)}
        }
    }
    
    
    @IBAction func placeOrderButtonPressed(_ sender: UIButton) {
        
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            ProgressHUD.showError("Please enter your name")
            return
        }
        ProgressHUD.show("Placing Order...")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { (result) in
            switch result {
                
            case .success(_):
                ProgressHUD.showSuccess("Your order has been received.👨🏻‍🍳")
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    
    
    
    private func populateView(){
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
    }
    
}
