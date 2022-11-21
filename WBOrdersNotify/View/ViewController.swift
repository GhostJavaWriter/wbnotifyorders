//
//  ViewController.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var label = UILabel()
    private var viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello WB"
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        viewModel.fetchBalance { [weak self] in
            print("fetching in viewController")
            let balance = self?.viewModel.getGoodsBalance()
            if balance != nil {
                DispatchQueue.main.async {
                    print("success label take number of goods")
                    self?.label.text = String(balance!)
                }
            } else {
                print("Balance nil")
            }
            
        }
    }
}

