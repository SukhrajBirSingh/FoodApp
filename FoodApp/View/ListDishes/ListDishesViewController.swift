//
//  ListDishesViewController.swift
//  FoodApp
//
//  Created by Admin on 2022-02-15.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    //for title name and dish id
    var category : DishCategory!
    
    
    
    var dishes : [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        title = category.name
        registerCells()
        
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id ?? "") { [weak self](result) in
            switch result{
                
            case .success(let categoryDishes):
                ProgressHUD.dismiss()
                self?.dishes = categoryDishes
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
        
    }
    
}

//MARK: - UITableView Delegate Methods
extension ListDishesViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
}

//MARK: - UITableView DataSource Methods
extension ListDishesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    
}
