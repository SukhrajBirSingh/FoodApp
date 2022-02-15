//
//  HomeViewController.swift
//  FoodApp
//
//  Created by Admin on 2022-02-14.
//

import UIKit

class HomeViewController: UIViewController {
   

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    
    @IBOutlet weak var chefCollectionView: UICollectionView!
    
    var categories : [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish5", image: "https://picsum.photos/100/200")
    ]
    
    var populars : [Dish] = [
    
        .init(id: "id1", name: "kaddi", description: "patatoes with gravy of besan", image: "https://picsum.photos/100/200", calories: 240),
        .init(id: "id1", name: "kaddu", description: "patatoes with gravy of besan", image: "https://picsum.photos/100/200", calories: 440),
        .init(id: "id1", name: "shahi paneer", description: "paneer with gravy of cream", image: "https://picsum.photos/100/200", calories: 230)
        
        
    ]
    
    var chef : [Dish] = [
    
        .init(id: "id1", name: "kaddi", description: "patatoes with gravy of besan", image: "https://picsum.photos/100/200", calories: 240),
        .init(id: "id1", name: "kaddu", description: "patatoes with gravy of besan", image: "https://picsum.photos/100/200", calories: 440),
        .init(id: "id1", name: "shahi paneer", description: "paneer with gravy of cream", image: "https://picsum.photos/100/200", calories: 230)
        
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        
        chefCollectionView.delegate = self
        chefCollectionView.dataSource = self

        
        
        // Do any additional setup after loading the view.
        registerCells()
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        
        chefCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
        
        
    }

}

extension HomeViewController : UICollectionViewDelegate {
    
}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count

        case popularCollectionView :
            return populars.count
            
        case chefCollectionView :
            return chef.count
        default : return 0
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView :
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
                return cell
            
        case chefCollectionView :
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: chef[indexPath.row])
                return cell
            
            
            
        default : return UICollectionViewCell()

        }
        
        
        
    }
    
    
}

