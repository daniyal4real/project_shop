//
//  ProductCell.swift
//  project
//
//  Created by dan on 05.04.2023.
//

import UIKit

class ProductCell: UITableViewCell {
    
    public static let identifier = "ProductCell"

    @IBOutlet weak var productView: UIView!
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    
    
    @IBOutlet weak var productButton: UIButton!
    
    var productsArr: [Product] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productName.contentMode = .scaleToFill
        productName.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    @IBAction func buttonPressed(_ sender: Any) {
//opk

    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destinationVC = segue.destination as? CartViewController {
//            destinationVC.cartProducts = productsArr
//        }
//    }
    
    
    
    
    
}
