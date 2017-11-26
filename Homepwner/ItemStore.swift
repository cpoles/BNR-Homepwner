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
    
    @discardableResult func createItem() -> Item {
        
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
}
