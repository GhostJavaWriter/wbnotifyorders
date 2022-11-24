//
//  MainViewController.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 24.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private var menuViewModel = MenuViewModel()
    
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

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuViewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        menuViewModel.titleForHeaderInSection(section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuViewModel.numberOfRowsInSection(section)
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
