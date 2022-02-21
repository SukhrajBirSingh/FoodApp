//
//  FavDishesViewController.swift
//  FoodApp
//
//  Created by Admin on 2022-02-15.
//

import UIKit

class FavDishesViewController: UIViewController {
    
//    var favDishes : [Dish] = [
//        .init(id: "id1", name: "kaddi", description: "patatoes with gravy of besan", image: "https://picsum.photos/100/200", calories: 240),
//        .init(id: "id1", name: "kaddu", description: "patatoes with gravy of besan", image: "https://picsum.photos/100/200", calories: 440),
//        .init(id: "id1", name: "shahi paneer", description: "paneer with gravy of cream", image: "https://picsum.photos/100/200", calories: 230)
//    ]
    
    let favDishes = favDish
    
    @IBOutlet weak var favTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorites"
        favTableView.delegate = self
        favTableView.dataSource = self
        registerCells()
        // Do any additional setup after loading the view.
    }
    
    private func registerCells() {
        favTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
        
    }
    
    
}



//MARK: - UITableView Delegate Methods
extension FavDishesViewController : UITableViewDelegate {
    
}


//MARK: - UITableVIew DataSource Methods
extension FavDishesViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return favDishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
            cell.setup(dish: favDishes[indexPath.row])
       
            return cell
        
    }
    
    
}
