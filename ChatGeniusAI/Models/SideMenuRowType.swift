//
//  SideMenuRowType.swift
//  ChatGeniusAI
//
//  Created by Apple on 11/10/2024.
//

enum SideMenuRowType: Int, CaseIterable{
    case mode = 0
    case delete
    case log
    
    var title: String{
        switch self {
        case .mode:
            return "Light Mode"
        case .delete:
            return "Delete Account"
        case .log:
            return "Log out"
        }
    }
    
    var iconName: String{
        switch self {
        case .mode:
            return "moon"
        case .delete:
            return "trash"
        case .log:
            return "iphone.and.arrow.right.outward"
        }
    }
}
