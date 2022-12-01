//
//  OrdersResultModel.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 29.11.2022.
//

import Foundation

struct OrdersResultModel: Decodable {
    
    let orders: [OrderModel]
    let total: Int
}
