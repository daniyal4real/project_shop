//
//  CartCell.swift
//  project
//
//  Created by dan on 05.04.2023.
//

import UIKit

class CartCell: UITableViewCell {

    public static let identifier = "CartCell"
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var productAmount: UILabel!
    @IBOutlet weak var deletButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func minusPressed(_ sender: Any) {
        var amount = (Int(productAmount.text!) ?? 0 ) - 1
        self.productAmount.text = String(amount)
    }
    
    @IBAction func plusPressed(_ sender: Any) {
    }
    
    @IBAction func deletePressed(_ sender: Any) {
    }
    
    @IBAction func buyPressed(_ sender: Any) {
    }
    
    
}
