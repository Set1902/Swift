//
//  Menu.swift
//  list1
//
//  Created by Sergei Kovalev on 13.02.2022.
//

import Foundation
import UIKit

class Recept: NSObject {
    
    //properties of a stock
    
    var Recept_id: String?
    var Pizza_id: String?
    var Sostav_id: String?
    var Count: String?
    var Ed: String?
    var name_produkt: String?
   
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name and @price parameters
    
    init(Recept_id: String, Pizza_id: String, Sostav_id: String, Count: String, Ed: String, name_produkt: String) {
        
        self.Recept_id = Recept_id
        self.Pizza_id = Pizza_id
        self.Sostav_id = Sostav_id
        self.Count = Count
        self.Ed = Ed
        self.name_produkt = name_produkt
       
        
    }
    
    
    //prints a stock's name and price
    
    override var description: String {
        return "Name: "
        
    }

}
