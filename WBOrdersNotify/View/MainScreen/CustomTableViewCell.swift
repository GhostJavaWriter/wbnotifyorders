//
//  CustomTableViewCell.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 24.11.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

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
    private lazy var orderNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private lazy var orderPriceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private lazy var orderDateCreatedLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var cellData: OrderModel? {
        didSet {
            guard let data = cellData else { return }
            orderNameLabel.text = data.orderId
            orderPriceLabel.text = String(data.totalPrice)
            orderDateCreatedLabel.text = data.dateCreated
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(orderNameLabel)
        addSubview(orderPriceLabel)
        addSubview(orderDateCreatedLabel)
        
        orderDateCreatedLabel.anchor(top: contentView.topAnchor,
                                     left: contentView.leftAnchor,
                                     bottom: contentView.bottomAnchor,
                                     right: nil,
                                     paddingTop: 10,
                                     paddingLeft: 10,
                                     paddingBottom: 0,
                                     paddingRight: 0,
                                     width: 0,
                                     height: 0,
                                     enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
