//
//  MainViewModel.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 24.11.2022.
//

import UIKit

class MainViewModel {
    
    private var sections = ["Активные заказы", "История заказов"]
    private var sectionContent = [["iCloud", "Reset Data Integrity"],
                                  ["Info","Credits","Privacy","Blog",]]
    
    private lazy var requestkManager = RequestManager()
    private var ordersFetchResult: OrdersResultModel?
    
    func fetchOrdersData(startDate: String, endDate: String, completion: @escaping () -> Void) {
        requestkManager.fetchOrdersData(startDate: startDate, endDate: endDate) { [weak self] result in
            self?.ordersFetchResult = result
            completion()
        }
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        sections[section]
    }
    func numberOfSections() -> Int {
        return 2
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        
        switch section {
        case 0: return 1
        case 1: return ordersFetchResult?.total ?? 0
        default: return 0
        }
    }
    
    func getCellDataAtIndexPath(_ indexPath: IndexPath) -> OrderModel? {
        ordersFetchResult?.orders[indexPath.row]
    }
}
