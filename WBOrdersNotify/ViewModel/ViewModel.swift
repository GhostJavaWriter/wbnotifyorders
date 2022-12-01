//
//  ViewModel.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 21.11.2022.
//

import Foundation

class ViewModel {
    
    // MARK: - Properties
    
    private lazy var requestkManager = RequestManager()
    private var stockFetchResult: StockResultModel?
    
    func fetchStocksData(take: Int, skip: Int, completion: @escaping () -> Void) {
        requestkManager.fetchStocksData(take: take, skip: skip) { [weak self] result in
            self?.stockFetchResult = result
            completion()
        }
    }
    
    // MARK: - TableView dataSource
    
    func numberOfRowsInSection() -> Int {
        return stockFetchResult?.stocks.count ?? 0
    }
    
    func getCellConfiguration(forIndexPath indexPath: IndexPath) -> String {
        guard let item = stockFetchResult?.stocks[indexPath.row] else { return "error" }
        return "\(item.name): \(item.stock)"
    }
    
    func getTitle() -> String {
        return stockFetchResult?.stocks[0].brand ?? "Default title"
    }
}
