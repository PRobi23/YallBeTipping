//
//  HomeTableViewCell.swift
//  YallBeTipping
//
//  Created by Robert Papp on 2025. 02. 28..
//

import UIKit

protocol HomeTableViewCellDelegate: AnyObject {
    func didAdd(at indexPath: IndexPath)
    func didMinus(at indexPath: IndexPath)
}

class HomeTableViewCell: UITableViewCell {

    weak var delegate: HomeTableViewCellDelegate?
    var indexPath: IndexPath?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var orderCountStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
        priceLabel.text = "$\(item.price)"
        img.image = UIImage(named: item.img)
        countLabel.text = "\(item.count)"
        if item.count > 0 {
            orderCountStackView.isHidden = false
        } else {
            orderCountStackView.isHidden = true
        }
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
