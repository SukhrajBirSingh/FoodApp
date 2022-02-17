//
//  ListOrdersViewController.swift
//  FoodApp
//
//  Created by Admin on 2022-02-15.
//

import UIKit

class ListOrdersViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var order : [Order] = [
        .init(id: "id", name: "Sukhraj", dish: .init(id: "id1", name: "kaddi", description: "patatoes with gravy of besan", image: "https://picsum.photos/100/200", calories: 240) ),
        .init(id: "id", name: "Sukhraj", dish: .init(id: "id1", name: "kaddi", description: "patatoes with gravy of besan", image: "https://picsum.photos/100/200", calories: 240) ),
        .init(id: "id", name: "Sukhraj", dish: .init(id: "id1", name: "kaddi", description: "patatoes with gravy of besan", image: "https://picsum.photos/100/200", calories: 240) )]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCells()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
   private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    
}


extension ListOrdersViewController : UITableViewDelegate{
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = order[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension ListOrdersViewController : UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(order: order[indexPath.row])
        return cell
    }
    
    
}

