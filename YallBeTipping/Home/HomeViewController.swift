//
//  ViewController.swift
//  YallBeTipping
//
//  Created by Robert Papp on 2025. 02. 27..
//

import UIKit

class HomeViewController: UIViewController {
    
    private var data: [MenuItem] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupTableView()
    }
    
    
    @IBOutlet private weak var tableView: UITableView!
    
    private func fetchData() {
        data = Api.shared.fetchData()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction private func didTapCartButton(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(
            name: ConfirmViewController.id,
                              bundle: nil)
        let items: [MenuItem] = getMenuItems()
        let vc = sb.instantiateViewController(identifier: ConfirmViewController.id) { coder in
            let confirmVC = ConfirmViewController(coder: coder, items: items)
            return confirmVC
            
        }
        
        pushVC(vc)
    }
    
    private func getMenuItems() -> [MenuItem] {
        var items: [MenuItem] = []
        for item in data {
            if item.count > 0 {
                items.append(item)
            }
        }
        return items
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.id,
                                                 for: indexPath) as! HomeTableViewCell
        let i = indexPath.row
        cell.configure(item: data[i], indexPath: indexPath)
        cell.delegate = self
        return cell
    }
}


extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.row].count += 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}

extension HomeViewController: HomeTableViewCellDelegate {
    func didAdd(at indexPath: IndexPath) {
        data[indexPath.row].count += 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func didMinus(at indexPath: IndexPath) {
        data[indexPath.row].count -= 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}
