//
//  Animation.swift
//  GroceryMarket
//
//  Created by Mitchel Igolimah on 7/26/22.
//

import Foundation
import UIKit

@objcMembers
class Animation : NSObject {
    func test() {
        
    }
}

@objcMembers
class TabBarFormat : NSObject {
//    override func viewDidLoad(){
//        super.viewDidLoad()
//
//        self.ChangeRadiusOfTabBarItem()
//    }
    
    func ChangeRadiusOfTabBarItem(_ tabBar: UITabBar)  {
        tabBar.layer.masksToBounds = true;
        tabBar.isTranslucent = true;
        tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
    }
}
