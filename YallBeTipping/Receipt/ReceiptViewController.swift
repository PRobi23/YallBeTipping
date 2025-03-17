//
//  ReceiptViewController.swift
//  YallBeTipping
//
//  Created by Robert Papp on 2025. 02. 27..
//

import UIKit

class ReceiptViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let items: [MenuItem]
    let tip: TipOptions
    let total: Double
    
    init(coder: NSCoder, items: [MenuItem], tip: TipOptions){
        self.items = items
        self.tip = tip
        self.total = items.calculateTotal(with: tip)
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ReceiptViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row < items.count {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ReceiptItemRow.id,
                for: indexPath) as! ReceiptItemRow
            cell.configure(item: items[row])
            return cell
        } else if row == items.count {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ReceiptTipRow.id,
                for: indexPath) as! ReceiptTipRow
            cell.configure(tip: tip)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ReceiptTotalRow.id,
                for: indexPath) as! ReceiptTotalRow
            cell.configure(total: total)
            return cell
        }
    }
}

extension ReceiptViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
