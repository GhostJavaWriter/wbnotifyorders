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
    
    private lazy var mainContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var dateCreatedLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var officeAddressLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var userStatusLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var orderModel: OrderModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .pagesBackgroundColor
        
        if let model = orderModel {
            
            dateCreatedLabel.text = model.dateCreated
            officeAddressLabel.text = model.officeAddress
            userStatusLabel.text = "\(model.userStatus)"
            totalPriceLabel.text = "\(model.totalPrice)"
        } else {
            print("order model nil")
        }
        
        view.addSubview(mainContainerView)
        
        mainContainerView.anchor(top: view.topAnchor, left: view.leftAnchor,
                                 bottom: view.bottomAnchor, right: view.rightAnchor,
                                 paddingTop: 100, paddingLeft: 20, paddingBottom: 20, paddingRight: 20,
                                 width: 0, height: 0, enableInsets: true)
        
        let stackView = UIStackView()
        stackView.backgroundColor = .lightGray
        mainContainerView.addSubview(stackView)
        
        stackView.anchor(top: mainContainerView.topAnchor, left: mainContainerView.leftAnchor,
                         bottom: nil, right: mainContainerView.rightAnchor,
                         paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20,
                         width: 0, height: 0, enableInsets: false)
        
        stackView.addArrangedSubview(dateCreatedLabel)
        stackView.addArrangedSubview(officeAddressLabel)
        stackView.addArrangedSubview(userStatusLabel)
        stackView.addArrangedSubview(totalPriceLabel)
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
    }
}
