//
//  ReceiptTotalRow.swift
//  YallBeTipping
//
//  Created by Robert Papp on 2025. 03. 12..
//

import UIKit

class ReceiptTotalRow: UITableViewCell {

    static let id = "ReceiptTotalRow"
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(total: Double){
        totalLabel.text = total.toCurrency()
    }

}
