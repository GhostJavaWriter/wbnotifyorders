//
//  Model.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 20.11.2022.
//

import Foundation

struct Model: Decodable {
    let stocks: [Stock]
    let total: Int
}
