//
//  File.swift
//  list1
//
//  Created by Sergei Kovalev on 27.02.2022.
//

import Foundation



class Profile: NSObject {
    
    //properties of a stock
    var customer_name: String = ""
    var customer_lastname: String = ""
    var customer_middlename: String = ""
    var nickname: String = ""
    var phone: String = ""
    var address: String = "" //= "Малый Тишинксий переулок, 14-16 Москва Росиия 123056"
    var customer_card: String = ""
   
    
    
    //empty constructor
    
    override init()
{
        
    }
   
    //construct with @name and @price parameters
    
    init(customer_name: String, customer_lastname: String, customer_middlename: String, nickname: String, phone: String, price: String, price1: String) {
        
        self.customer_name = customer_name
        self.customer_lastname = customer_lastname
        self.customer_middlename = customer_middlename
        self.nickname = nickname
        self.phone = phone
        self.address = price
        self.customer_card = price1
       
        
    }
    
    
    //prints a stock's name and price
    
    override var description: String {
        return "Name: "
        // \(String(describing: pizzaName)), Price: \(String(describing: address)), Price1: \(String(describing: Price))
        
    }

}
