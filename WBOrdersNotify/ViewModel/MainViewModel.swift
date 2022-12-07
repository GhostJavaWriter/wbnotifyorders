//
//  MainViewModel.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 24.11.2022.
//

import UIKit

class MainViewModel {
    
    private var sections = ["Новые", "В работе", "Завершенные"]
    private var newOrders : [OrderModel] = []
    private var ordersInProgress : [OrderModel] = []
    private var completedOrders : [OrderModel] = []
    
    private lazy var requestManager = RequestManager()
    private var ordersFetchResult: OrdersResultModel?
    
    func fetchOrdersData(startDate: String, endDate: String, completion: @escaping () -> Void) {
        requestManager.fetchOrdersData(startDate: startDate, endDate: endDate) { [weak self] result in
            
            self?.ordersFetchResult = result
            if let orders = self?.ordersFetchResult?.orders {
                for order in orders {
                    print(order.userStatus)
                    switch order.userStatus {
                    case 0: self?.newOrders.append(order)
                    case 1: self?.ordersInProgress.append(order)
                    case 2,3,4: self?.completedOrders.append(order)
                    default: break
                    }
                }
            }
            completion()
        }
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        sections[section]
    }
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        
        switch section {
        case 0: return newOrders.count
        case 1: return ordersInProgress.count
        case 2,3,4: return completedOrders.count
        default: return 0
        }
    }
    
    func getCellDataAtIndexPath(_ indexPath: IndexPath) -> OrderModel? {
        
        switch indexPath.section {
        case 0: return newOrders[indexPath.row]
        case 1: return ordersInProgress[indexPath.row]
        case 2,3,4: return completedOrders[indexPath.row]
        default: return nil
        }

    }
}
