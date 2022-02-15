//
//  CategoryCollectionViewCell.swift
//  FoodApp
//
//  Created by Admin on 2022-02-14.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    //identifier
    static let identifier =  String(describing : CategoryCollectionViewCell.self)

    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    func setup (category : DishCategory){
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl) //converting string to URL
    }
}
