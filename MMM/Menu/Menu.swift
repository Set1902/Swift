//
//  Menu.swift
//  list1
//
//  Created by Sergei Kovalev on 13.02.2022.
//

// исправить добавление в заказ при количестве 0

import Foundation
import UIKit

class Menu: NSObject {
    
    //properties of a stock
    var Pizza_id: String?
    var name: String?
    var price: String?
    var image: String?
    var Nalichue: String?
   
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name and @price parameters
    
    init(Pizza_id: String, name: String, price: String, image: String, Nalichue: String) {
        
        self.Pizza_id = Pizza_id
        self.name = name
        self.price = price
        self.image = image
        self.Nalichue = Nalichue
       
        
    }
    
    
    //prints a stock's name and price
    
    override var description: String {
        return "Name: \(String(describing: name)), Price: \(String(describing: price))"
        
    }

}
