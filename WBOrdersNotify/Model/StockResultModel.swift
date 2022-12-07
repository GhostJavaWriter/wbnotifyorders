//
//  StockModel.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 20.11.2022.
//

import Foundation

struct StockResultModel: Decodable {
    
    let stocks: [StockModel]
    let total: Int
}
