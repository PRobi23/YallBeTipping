//
//  ConfirmCell.swift
//  YallBeTipping
//
//  Created by Robert Papp on 2025. 03. 07..
//

import UIKit

protocol ConfirmCellDelegate : AnyObject {
    func didAdd(at indexPath: IndexPath)
    func didMinus(at indexPath: IndexPath)
}

class ConfirmCell: UITableViewCell {
    static let id = "ConfirmCell"
    weak var delegate: ConfirmCellDelegate?

    private var indexPath: IndexPath?

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    @IBOutlet private weak var img: UIImageView!
    
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        img.layer.cornerRadius = 12
        plusButton.layer.cornerRadius = plusButton.frame.height / 2
        minusButton.layer.cornerRadius = minusButton.frame.height / 2
    }
    
    func configure(item: MenuItem, indexPath: IndexPath) {
        self.indexPath = indexPath
        nameLabel.text = item.name
        priceLabel.text = item.price.toCurrency()
        img.image = UIImage(named: item.img)
        countLabel.text = "\(item.count)"
    }
    
   
    @IBAction func didTapPlusButton() {
        guard let indexPath else { return }
        delegate?.didAdd(at: indexPath )
    }
    
    @IBAction func didTapMinusButton() {
        guard let indexPath else { return }
        delegate?.didMinus(at: indexPath)
    }
    
}
