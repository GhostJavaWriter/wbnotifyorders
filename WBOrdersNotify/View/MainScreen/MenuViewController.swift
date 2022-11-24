//
//  MenuViewController.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 24.11.2022.
//

import UIKit

class MenuViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: view.frame, style: .insetGrouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .red
        table.backgroundColor = .pagesBackgroundColor
        return table
    }()
    
    override func viewDidLoad() {
        
        view.addSubview(tableView)
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return 2
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = "Section: \(indexPath.section) Row: \(indexPath.row)"
        cell.contentConfiguration = config
        cell.backgroundColor = .white
        return cell
    }
}
