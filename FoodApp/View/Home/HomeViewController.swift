//
//  HomeViewController.swift
//  FoodApp
//
//  Created by Admin on 2022-02-14.
//

import UIKit
import ProgressHUD
class HomeViewController: UIViewController {
   

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    
    @IBOutlet weak var chefCollectionView: UICollectionView!
    
    @IBAction func favButtonPressed(_ sender: UIBarButtonItem) {
        let controller = FavDishesViewController.instantiate()
        
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
    var categories : [DishCategory] = [
        
    ]
    
    var populars : [Dish] = [
    
        
    ]
    
    var chef : [Dish] = [
    
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories(completion: { [weak self](result) in
            
            switch result {
                
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.chef = allDishes.specials ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.chefCollectionView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError("The error is: \(error.localizedDescription)")
            }
        })
        
        
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


//MARK: - UICollectionViewDelegate Methods

extension HomeViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            let controller = ListDishesViewController.instantiate()
            
            controller.category = categories[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
            
        }else {
            let controller = DishDetailViewController.instantiate()
            //sending what item is selected
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : chef[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
        }
    
}
}


//MARK: - UICollectionView DataSource Methods
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

