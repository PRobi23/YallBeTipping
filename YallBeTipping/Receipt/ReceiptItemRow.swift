//
//  ReceiptItemRow.swift
//  YallBeTipping
//
//  Created by Robert Papp on 2025. 03. 12..
//

import UIKit

class ReceiptItemRow: UITableViewCell {

    static let id = "ReceiptItemRow"
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(item:MenuItem){
        nameLabel.text = item.name
        countLabel.text = "\(item.count)"
        let count = Double(item.count)
        let total = item.price * count
        priceLabel.text = total.toCurrency()
    }

}
