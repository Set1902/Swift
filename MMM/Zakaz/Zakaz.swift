//
//  Zakaz.swift
//  list1
//
//  Created by Sergei Kovalev on 13.02.2022.
//

import Foundation
import UIKit

class Zakaz: NSObject {
    
    //properties of a stock
    var Zakaz_id: String?
    var pizzaName: String?
    var numberOfPizzas: String? 
    var Price: String?
   
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name and @price parameters
    
    init(Zakaz_id: String, name: String, price: String, price1: String) {
        
        self.Zakaz_id = Zakaz_id
        self.pizzaName = name
        self.numberOfPizzas = price
        self.Price = price1
       
        
    }
    
    
    //prints a stock's name and price
    
    override var description: String {
        return "Name: \(String(describing: pizzaName)), Price: \(String(describing: numberOfPizzas)), Price1: \(String(describing: Price))"
        
    }

}
