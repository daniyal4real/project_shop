//
//  CartViewController.swift
//  project
//
//  Created by dan on 05.04.2023.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cartProducts: [Product] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CartCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: CartCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartCell.identifier, for: indexPath) as! CartCell
        cell.productName.text = cartProducts[indexPath.row].title
        cell.productPrice.text = String(cartProducts[indexPath.row].price)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProducts.count 
    }

}
