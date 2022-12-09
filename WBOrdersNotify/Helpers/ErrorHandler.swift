//
//  ErrorHandler.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 9.12.2022.
//

import Foundation

enum NetworkErrors: Swift.Error {
    case requestError
}

enum UnexpectedErrors {
    case cannotFindProductWithBarcode
}

