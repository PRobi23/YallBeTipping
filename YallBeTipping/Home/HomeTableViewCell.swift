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
    
    static let id = "HomeTableViewCell"

    weak var delegate: HomeTableViewCellDelegate?
    private var indexPath: IndexPath?
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var img: UIImageView!
    
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var minusButton: UIButton!

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
        priceLabel.text = item.price.toCurrency()
        img.image = UIImage(named: item.img)
        countLabel.text = "\(item.count)"
        if item.count > 0 {
            orderCountStackView.isHidden = false
        } else {
            orderCountStackView.isHidden = true
        }
    }
    
    @IBAction private func didTapPlusButton() {
        guard let indexPath else { return }
        delegate?.didAdd(at: indexPath )
    }
    
    
    @IBAction private func didTapMinusButton() {
        guard let indexPath else { return }
        delegate?.didMinus(at: indexPath)
    }
}
