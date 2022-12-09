//
//  OrderModel.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 29.11.2022.
//

import Foundation

struct OrderModel: Decodable {

    let dateCreated: String
    let orderUID: String
    let officeAddress: String
    let orderId: String
    let chrtId: Int
    let barcode: String
    let userStatus: Int
    let totalPrice: Int
    let convertedPrice: Int
    let deliveryType: Int
}
