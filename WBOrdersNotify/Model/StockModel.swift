//
//  StockModel.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 20.11.2022.
//

import Foundation

struct StockModel: Decodable {
   
    let brand: String
    let name: String
    let barcode: String
    let article: String
    let stock: Int
}
