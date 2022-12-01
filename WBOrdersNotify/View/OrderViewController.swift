//
//  OrderViewController.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 1.12.2022.
//

import UIKit

class OrderViewController: UIViewController {
    /*
     let dateCreated: String
     let orderUID: String
     let officeAddress: String
     let orderId: String
     let barcode: String
     let userStatus: Int
     let totalPrice: Int
     let convertedPrice: Int
     let deliveryType: Int
     */
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var mainContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        return view
    }()
    
    var orderModel: OrderModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .pagesBackgroundColor
        view.addSubview(mainContainerView)
        mainContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 100, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 0, enableInsets: true)
        
    }
}
