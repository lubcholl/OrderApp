//
//  Restoration.swift
//  OrderApp
//
//  Created by Lyubomir Lazarov on 9/23/21.
//

import Foundation
import UIKit

extension NSUserActivity {
    var order: Order? {
        get {
            guard let jsonData = userInfo?["order"] as? Data else {
                return nil
            }
            return try? JSONDecoder().decode(Order.self, from: jsonData)
        }
        
        set {
            if let newValue = newValue, let jsonData = try? JSONEncoder().encode(newValue) {
                addUserInfoEntries(from: ["order": jsonData])
            } else {
                    userInfo?["order"] = nil
            }
        }
    }
    var controllerIdentifier: StateRestorationController.Identifier? {
        get {
            guard let controllerIdentifierString = userInfo?["controllerIdentifier"] as? String else { return nil }
            return StateRestorationController.Identifier(rawValue: controllerIdentifierString)
        }
        set {
            userInfo?["controllerIdentifier"] = newValue?.rawValue
        }
    }
    
    var menuCategory: String? {
        get {
            return userInfo?["menuCategory"] as? String
        }
        set {
            userInfo?["menuCategory"] = newValue
        }
    }
    
    var menuItem: MenuItem? {
        get {
            guard let jsonData = userInfo?["menuItem"] as? Data else { return nil }
            return try? JSONDecoder().decode(MenuItem.self, from: jsonData)
        }
        set {
            if let newValue = newValue, let jsonData = try? JSONEncoder().encode(newValue) {
                addUserInfoEntries(from: ["menuItem": jsonData])
            } else {
                userInfo?["menuItem"] = nil 
            }
        }
    }
    
}
// това съм го извикал в MenuController в didSet-a на order

enum StateRestorationController {
    
    case categories
    case menu(category: String)
    case menuItemDetail(MenuItem)
    case order
    
    enum Identifier: String {
        case categories,menu,menuItemDetail, order
    }
    
    var identifier: Identifier {
        switch self {
        case .categories: return Identifier.categories
        case .menu: return Identifier.menu
        case .menuItemDetail: return Identifier.menuItemDetail
        case .order: return Identifier.order
        }
    }
    
    init?(userActivity: NSUserActivity) {
        guard let identifier = userActivity.controllerIdentifier else { return nil }
    
        switch identifier {
        case .categories:
            self = .categories
        case .menu:
            if let category = userActivity.menuCategory {
                self = .menu(category: category)
            } else {
                return nil
            }
        case .menuItemDetail:
            if let menuItem = userActivity.menuItem {
                self = .menuItemDetail(menuItem)
            } else {
                return nil
            }
        case .order:
            self = .order
        }
    }
    
}
