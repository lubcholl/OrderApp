//
//  Order.swift
//  OrderApp
//
//  Created by Lyubomir Lazarov on 9/19/21.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
