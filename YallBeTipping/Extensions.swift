//
//  Extensions.swift
//  YallBeTipping
//
//  Created by Robert Papp on 2025. 03. 12..
//

import UIKit

extension [MenuItem] {
    func calculateTotal(with tip: TipOptions) -> Double {
        var total: Double = 0
        self.forEach { item in
            let count = Double(item.count)
            let sum = count * item.price
            total += sum
        }
        return total * tip.rawValue
    }
}

extension Double {
    func toCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        let value = NSNumber(value: self)
        let str = formatter.string(from: value)
        return str ?? "N/A"
    }
}

extension UIViewController {
    func pushVC(_ vc: UIViewController){
        navigationController?.pushViewController(vc, animated: true)
    }
}
