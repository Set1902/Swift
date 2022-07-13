//
//  Menu.swift
//  list1
//
//  Created by Sergei Kovalev on 13.02.2022.
//

import Foundation
import UIKit

class SSostav: NSObject {
    
    //properties of a stock
    var Sostav_id: String?
    var name_produkt: String?
    var kolichestvo: String?
   
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @name and @price parameters
    
    init(Sostav_id: String, name_produkt: String, kolichestvo: String) {
        
        self.Sostav_id = Sostav_id
        self.name_produkt = name_produkt
        self.kolichestvo = kolichestvo
       
        
    }
    
    
    //prints a stock's name and price
    
    override var description: String {
        return "Name: \(String(describing: name_produkt)), Price: \(String(describing: kolichestvo))"
        
    }

}
