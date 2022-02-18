//
//  ListOrdersViewController.swift
//  FoodApp
//
//  Created by Admin on 2022-02-15.
//

import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var order : [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCells()
        tableView.delegate = self
        tableView.dataSource = self
        
        ProgressHUD.show()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders { [weak self](result) in
            switch result{
                
            case .success(let orders):
                ProgressHUD.dismiss()
                self?.order = orders
                self?.tableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
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

