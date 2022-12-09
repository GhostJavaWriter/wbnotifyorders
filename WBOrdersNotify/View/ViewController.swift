//
//  ViewController.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: UI elements
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        view.addSubview(indicator)
//        try this:
//        UIActivityIndicatorView(frame: CGRect(origin: view.center, size: .zero))
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return indicator
    }()
    
    private lazy var tableView: UITableView = {
       
        let table = UITableView(frame: view.frame)
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        table.delegate = self
        table.dataSource = self
        view.addSubview(table)
        return table
    }()
    
    // MARK: Properties
    
    private var viewModel = ViewModel()
    
    private let cellID = String(describing: UITableViewCell.self)

    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .pagesBackgroundColor

    }
    
    // MARK: Support functions
    
    private func configureSubview() {
        
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = viewModel.getCellConfiguration(forIndexPath: indexPath)
        cell.contentConfiguration = config
        return cell
    }
}
