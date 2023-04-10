//
//  SearchViewController.swift
//  project
//
//  Created by dan on 05.04.2023.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var products: [Product] = []
    var searchProducts: [Product] = []
    private var searching: Bool = false
    private var productTitle = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Поиск"
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        showProducts()
    }
    
    
    func showProducts() {
        let url = "https://fakestoreapi.com/products"
        
        AF.request(url).response { response in
            if let data = response.data {
                do {
                    let productsList = try JSONDecoder().decode([Product].self, from: data)
                    self.products = productsList
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print("Ошибка \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // find the existing label with tag 100 or create a new one
        var titleLabel = cell.contentView.viewWithTag(100) as? UILabel
        if titleLabel == nil {
            titleLabel = UILabel(frame: cell.contentView.bounds)
            titleLabel!.tag = 100
            titleLabel!.textAlignment = .left
            titleLabel!.textColor = .black
            titleLabel!.contentMode = .scaleAspectFit
            titleLabel!.numberOfLines = 0
            cell.contentView.addSubview(titleLabel!)
        }
        
        if searching {
            titleLabel?.text = searchProducts[indexPath.row].title
        } else {
            titleLabel?.text = products[indexPath.row].title
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return self.searchProducts.count
        } else {
            return self.products.count
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        self.searchBar.delegate = self
////        self.productTitle = searchProducts.filter({$0.title.lowercased().prefix(searchText.count) == searchText.lowercased()})
//        self.searchProducts = products.filter({$0.title.lowercased().prefix(searchText.count) == searchText.lowercased() })
//        self.searching = true
//        self.tableView.reloadData()
//    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchProducts = products.filter({$0.title.lowercased().range(of: searchText.lowercased()) != nil })
        self.searching = true
        
        if searchText == "" {
            searching = false
        }
        self.tableView.reloadData()
    }

}

