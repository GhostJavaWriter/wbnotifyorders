//
//  MenuViewModel.swift
//  WBOrdersNotify
//
//  Created by Bair Nadtsalov on 24.11.2022.
//

import UIKit

class MenuViewModel {
    
    private var sections = ["Активные заказы", "История заказов"]
    private var sectionContent = [["iCloud", "Reset Data Integrity"],
                                  ["Info","Credits","Privacy","Blog",]]

    
    func titleForHeaderInSection(_ section: Int) -> String {
        sections[section]
    }
    func numberOfSections() -> Int {
        sections.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        sectionContent[section].count
    }
    
    func cellForAtIndexPath() {
        
    }
}
