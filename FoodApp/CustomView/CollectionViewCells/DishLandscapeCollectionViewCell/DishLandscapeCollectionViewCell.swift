//
//  DishLandscapeCollectionViewCell.swift
//  FoodApp
//
//  Created by Admin on 2022-02-14.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DishLandscapeCollectionViewCell"

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    
    func setup(dish : Dish) {
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        discriptionLabel.text = dish.description
        caloriesLabel.text = dish.formattedCalories
    }
}
