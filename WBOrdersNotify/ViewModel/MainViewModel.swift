//
//  MainViewModel.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 24.11.2022.
//

import UIKit

class MainViewModel {
    
    private var sections = ["Ожидают", "Новые", "Отменено", "Возврат", "Брак", "Доставлено"]
    private var newOrders : [OrderModel] = [] // status 0
    private var canceledOrders : [OrderModel] = [] // status 1
    private var deliveredOrders : [OrderModel] = [] // status 2
    private var returnedOrders : [OrderModel] = [] // status 3
    private var waitingOrders : [OrderModel] = [] // status 4
    private var defectedOrders : [OrderModel] = [] // status 5
    
    private lazy var requestManager = RequestManager()
    private var ordersFetchResult: OrdersResultModel?
    
    func fetchOrdersData(startDate: String, endDate: String, completion: @escaping () -> Void) {
        requestManager.fetchOrdersData(startDate: startDate, endDate: endDate) { [weak self] result in
            
            self?.ordersFetchResult = result
            if let orders = self?.ordersFetchResult?.orders {
                for order in orders {
                    switch order.userStatus {
                    case 0: self?.newOrders.insert(order, at: 0)
                    case 1: self?.canceledOrders.insert(order, at: 0)
                    case 2: self?.deliveredOrders.insert(order, at: 0)
                    case 3: self?.returnedOrders.insert(order, at: 0)
                    case 4: self?.waitingOrders.insert(order, at: 0)
                    case 5: self?.defectedOrders.insert(order, at: 0)
                    default: break
                        /*
                         0 - Новый заказ.
                         1 - Отмена клиента.
                         2 - Доставлен.
                         3 - Возврат.
                         4 - Ожидает.
                         5 - Брак.
                         */
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
        case 0: return waitingOrders.count
        case 1: return newOrders.count
        case 2: return canceledOrders.count
        case 3: return returnedOrders.count
        case 4: return defectedOrders.count
        case 5: return deliveredOrders.count
        default: return 0
        }
    }
    //["Ожидают", "Новые", "Отменено", "Возврат", "Брак", "Доставлено"]
    func getCellDataAtIndexPath(_ indexPath: IndexPath) -> OrderModel? {
        
        switch indexPath.section {
        case 0: return waitingOrders[indexPath.row]
        case 1: return newOrders[indexPath.row]
        case 2: return canceledOrders[indexPath.row]
        case 3: return returnedOrders[indexPath.row]
        case 4: return defectedOrders[indexPath.row]
        case 5: return deliveredOrders[indexPath.row]
        default: return nil
        }
    }
}
