//
//  ListDishesViewController.swift
//  FoodApp
//
//  Created by Admin on 2022-02-15.
//

import UIKit

class ListDishesViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    //for title name
    var category : DishCategory!
    
    
    
    var dishes : [Dish] = [
        .init(id: "id1", name: "kaddi", description: "patatoes with gravy of besan", image: "https://picsum.photos/100/200", calories: 240),
        .init(id: "id1", name: "kaddu", description: "patatoes with gravy of besan", image: "https://picsum.photos/100/200", calories: 440),
        .init(id: "id1", name: "shahi paneer", description: "paneer with gravy of cream", image: "https://picsum.photos/100/200", calories: 230)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        title = category.name
        registerCells()
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
