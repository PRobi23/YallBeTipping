//
//  ConfirmViewController.swift
//  YallBeTipping
//
//  Created by Robert Papp on 2025. 02. 27..
//

import UIKit

class ConfirmViewController: UIViewController {

    lazy var barButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(didTapBarButton))
        return button
    }()
    
    @IBOutlet weak var tableView: UITableView!
    var items: [MenuItem]
    
    init?(coder: NSCoder, items: [MenuItem]) {
        self.items = items
        super.init(coder: coder)
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ConfirmCell", bundle: nil),
                           forCellReuseIdentifier: "ConfirmCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Confirm"
        setupTableView()
        navigationItem.rightBarButtonItem = barButton
    }
                                     
    @objc func didTapBarButton(){
        let sb = UIStoryboard(name: "Tip", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "TipViewController") { [unowned self] coder in
            let tipVc = TipViewController(coder: coder, items: items)
            return tipVc
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ConfirmViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmCell",
                                                 for: indexPath) as! ConfirmCell
        let i = indexPath.row
        cell.configure(item: items[i], indexPath: indexPath)
        cell.delegate = self
        return cell
    }
}

extension ConfirmViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}

extension ConfirmViewController : ConfirmCellDelegate {
    func didAdd(at indexPath: IndexPath) {
        items[indexPath.row].count += 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func didMinus(at indexPath: IndexPath) {
        items[indexPath.row].count -= 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
 
}
