//
//  MainViewController.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 24.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private var mainViewModel = MainViewModel()
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: view.frame, style: .insetGrouped)
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .red
        table.backgroundColor = .pagesBackgroundColor
        return table
    }()
    
    override func viewDidLoad() {
        
        view.addSubview(tableView)
        
        updateStoreStocks()
        fetchOrders()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return mainViewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        mainViewModel.titleForHeaderInSection(section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainViewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else {
            print("default cell")
            return UITableViewCell() }
        cell.cellData = mainViewModel.getCellDataAtIndexPath(indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let viewController = OrderViewController()
        viewController.orderModel = mainViewModel.getCellDataAtIndexPath(indexPath)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

private extension MainViewController {
    func updateStoreStocks() {
        mainViewModel.updateStoreStocks { error in
            if error == nil {
                NSLog("Store stocks updated")
            } else {
                NSLog("Store stocks updating error")
            }
        }
    }
    
    func fetchOrders() {
        mainViewModel.fetchOrdersData(startDate: "2022-11-01T00:00:00Z",
                                      endDate: "2022-12-29T00:00:00Z")
        { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}
