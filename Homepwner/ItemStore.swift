//
//  ItemStore.swift
//  Homepwner
//
//  Created by Carlos Poles on 26/11/17.
//  Copyright © 2017 Carlos Poles. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    var aboveFifty: [Item] {
        return allItems.filter { $0.valueInDollars > 50 }.sorted { $0.valueInDollars > $1.valueInDollars }
    }
    
    var belowFifty: [Item] {
        return allItems.filter { $0.valueInDollars < 50 }.sorted { $0.valueInDollars > $1.valueInDollars }
    }
    
    @discardableResult func createItem() -> Item {
        
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
}
